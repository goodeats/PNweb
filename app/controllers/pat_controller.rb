require "open-uri"
class PatController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_meta_pat
  include SetMetaTags

  def index
    @page_keywords = @page_keywords << 'home'
    @abouts = About.published.prioritized
  end

  def image_url
    # https://stackoverflow.com/questions/9945690/rails-is-it-possible-to-give-external-image-a-local-url
    response.headers['Cache-Control'] = "public, max-age=#{84.hours.to_i}"
    response.headers['Content-Type'] = 'image/jpg'
    response.headers['Content-Disposition'] = 'inline'
    render plain: open(ENV['PAGE_IMAGE_URL'], "rb").read
  end

  # https://collectiveidea.com/blog/archives/2016/01/12/lets-encrypt-with-a-rails-app-on-heroku
  # render plain => https://makandracards.com/makandra/25019-when-using-render-text-set-a-content-type
  # not free with heroku anymore 🤷🏻‍♂️
  def letsencrypt
    render plain: ENV['LETSENCRYPT_CERT']
  end

  private

  def set_meta_pat
    @page_title = 'home'
  end

end

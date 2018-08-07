class PatController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  # https://collectiveidea.com/blog/archives/2016/01/12/lets-encrypt-with-a-rails-app-on-heroku
  # render plain => https://makandracards.com/makandra/25019-when-using-render-text-set-a-content-type
  def letsencrypt
    render plain: ENV['LETSENCRYPT_CERT']
  end

end

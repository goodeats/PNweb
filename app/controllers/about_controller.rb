class AboutController < ApplicationController
  include SetMetaTags
  skip_before_action :authenticate_user!
  before_action :set_meta_about

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'about', :about_index_path

  def index
    @abouts = About.published.asc
  end

  private

  def set_meta_about
    @page_title = 'about me'
    @page_description = 'About Pat Needham'
    @page_keywords = @page_keywords + keywords_about
  end

  def keywords_about
    ['about', 'me', 'bio', 'professional', 'personal', 'opencity', 'ditto', 'general', 'assembly', 'wdi']
  end

end

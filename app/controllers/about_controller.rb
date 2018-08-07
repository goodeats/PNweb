class AboutController < ApplicationController
  skip_before_action :authenticate_user!

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'about', :about_index_path

  def index
    @abouts = About.published.asc
  end
end

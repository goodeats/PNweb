class DemosController < ApplicationController
  before_action :redirect_to_home
  skip_before_action :authenticate_user!
  before_action :set_meta_demos, only: [:index]
  before_action :set_demo, :set_meta_demo, only: [:show]
  include SetMetaTags

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'demos', :demos_path

  def index
    @demos = Demo.published.desc
  end

  def show
    if @demo.published
      add_breadcrumb @demo.title, demo_path(@demo)
    else
      redirect_to demos_path
    end
  end

  private

  def redirect_to_home
    redirect_to root_path, warning: 'nah'
  end

  def set_demo
    @demo = Demo.find_by_param(params[:id]) || Demo.find(params[:id])
  end

  def set_meta_demos
    @page_title = 'my demos'
    @page_description = 'Demos by Pat Needham'
    @page_keywords = @page_keywords + keywords_demos
  end

  def set_meta_demo
    @page_title = @demo.title
    @page_description = "#{@demo.title} | Demos by Pat Needham"
    @page_keywords = @page_keywords + keywords_demos
  end

  def keywords_demos
    ['demos', 'react', 'magiceye', 'magic', 'eye']
  end
end

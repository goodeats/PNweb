class DemosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_demo, only: [:show]

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'demos', :demos_path

  def index
    @demos = Demo.published.desc
    @page_title = 'my demos'
    @page_description = 'Demos by Pat Needham'
    @page_keywords = @page_keywords + ['demos', 'react', 'magiceye', 'magic', 'eye']
  end

  def show
    if @demo.published
      add_breadcrumb @demo.title, demo_path(@demo)
      @page_title = @demo.title
      @page_description = "#{@demo.title} | Demos by Pat Needham"
      @page_keywords = @page_keywords + ['demos', 'demo', 'react', 'magiceye', 'magic', 'eye']
    else
      redirect_to demos_path
    end
  end

  private

  def set_demo
    @demo = Demo.find(params[:id])
  end
end

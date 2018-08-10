class DemosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_demo, only: [:show]

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

  def set_demo
    @demo = Demo.find(params[:id])
  end
end

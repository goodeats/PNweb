class DemosController < ApplicationController
  skip_before_action :authenticate_user!

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'demos', :demos_path

  def index
    @demos = Demo.desc
  end
end

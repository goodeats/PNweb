class Admin::ProjectsController < ApplicationController

  # add_breadcrumb 'admin', :admin_path, title: 'Back to Admin'
  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'projects', :admin_projects_path

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

end

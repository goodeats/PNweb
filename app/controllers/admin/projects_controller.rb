class Admin::ProjectsController < ApplicationController

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'projects', :admin_projects_path

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    add_breadcrumb @project.name, admin_project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
    @action = 'edit'
    add_breadcrumb @project.name, admin_project_path(@project)
    add_breadcrumb 'edit', edit_admin_project_path(@project)
  end

end

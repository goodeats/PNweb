class Admin::ProjectsController < ApplicationController

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'projects', :admin_projects_path

  def index
    @projects = Project.all
    add_breadcrumb 'create project', new_admin_project_path
  end

  def show
    @project = Project.find(params[:id])
    add_breadcrumb @project.name, admin_project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
    add_breadcrumb @project.name, admin_project_path(@project)
    add_breadcrumb 'edit', edit_admin_project_path(@project)
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "updated #{@project.name}!"
      redirect_to admin_project_path(@project)
    else
      render :edit
    end
  end

  def new
    @project = Project.new
    add_breadcrumb 'create project'
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_project_path(@project)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :published, :external, :url, :description)
  end

end
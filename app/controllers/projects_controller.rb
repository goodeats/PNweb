class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'projects', :projects_path

  def index
    @projects = Project.published.desc
  end

end

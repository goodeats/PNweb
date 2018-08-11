class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'projects', :projects_path

  def index
    @projects = Project.published.desc
    @page_title = 'my projects'
    @page_description = 'Projects by Pat Needham'
    @page_keywords = @page_keywords + ['projects', 'opencity', 'ditto', 'professional', 'personal']
  end

end

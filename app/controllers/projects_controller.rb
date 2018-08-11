class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_meta_projects
  include SetMetaTags

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'projects', :projects_path

  def index
    @projects = Project.published.desc
  end

  private

  def set_meta_projects
    @page_title = 'my projects'
    @page_description = 'Projects by Pat Needham'
    @page_keywords = @page_keywords + keywords_projects
  end

  def keywords_projects
    ['projects', 'opencity']
    # TODO: figure out how to accomplish this (before_action)
    # ['projects'] + @projects.pluck(:title)
  end

end

class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @projects = Project.published
  end

end

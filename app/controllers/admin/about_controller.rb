class Admin::AboutController < ApplicationController

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'about', :admin_about_index_path

  def index
    @abouts = About.all
    add_breadcrumb 'create about', new_admin_project_path
  end

  def show
    @about = About.find(params[:id])
    add_breadcrumb @about.name, admin_project_path(@about)
  end

  def edit
    @about = About.find(params[:id])
    add_breadcrumb @about.name, admin_project_path(@about)
    add_breadcrumb 'edit', edit_admin_project_path(@about)
  end

  def update
    @about = About.find(params[:id])
    if @about.update(project_params)
      flash[:success] = "updated #{@about.name}!"
      redirect_to admin_project_path(@about)
    else
      render :edit
    end
  end

  def new
    @about = About.new
    add_breadcrumb 'create about'
  end

  def create
    @about = About.new(project_params)
    if @about.save
      redirect_to admin_project_path(@about)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:about).permit(:name, :published, :external, :url, :description)
  end

end

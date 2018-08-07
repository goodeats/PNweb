class Admin::AboutController < ApplicationController

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'about', :admin_about_index_path

  def index
    @abouts = About.all
    add_breadcrumb 'create about', new_admin_about_path
  end

  def show
    @about = About.find(params[:id])
    add_breadcrumb @about.title, admin_about_path(@about)
  end

  def edit
    @about = About.find(params[:id])
    # had to set action explicitly for singular resource
    # uncomfortable with 'show', but it sets the correct path for the form
    @action = 'show'
    add_breadcrumb @about.title, admin_about_path(@about)
    add_breadcrumb 'edit', edit_admin_project_path(@about)
  end

  def update
    @about = About.find(params[:id])
    if @about.update(about_params)
      flash[:success] = "updated #{@about.title}!"
      redirect_to admin_about_path(@about)
    else
      render :edit
    end
  end

  def new
    @about = About.new
    @action = 'create'
    add_breadcrumb 'create about'
  end

  def create
    @about = About.new(about_params)
    if @about.save
      redirect_to admin_about_path(@about)
    else
      render :new
    end
  end

  def destroy
    @about = About.find(params[:id])
    @about.destroy
    redirect_to admin_about_index_path
  end

  private

  def about_params
    params.require(:about).permit(:title, :published, :text)
  end

end

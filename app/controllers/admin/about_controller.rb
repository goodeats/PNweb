class Admin::AboutController < Admin::AdminController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'about', :admin_about_index_path

  def index
    @abouts = About.asc
    add_breadcrumb 'create about', new_admin_about_path
    @page_title = 'about me'
  end

  def show
    add_breadcrumb @about.title, admin_about_path(@about)
    @page_title = @about.title
  end

  def edit
    # had to set action explicitly for singular resource
    # uncomfortable with 'show', but it sets the correct path for the form
    @action = 'show'
    add_breadcrumb @about.title, admin_about_path(@about)
    add_breadcrumb 'edit', edit_admin_project_path(@about)
    @page_title = "edit #{@about.title}"
  end

  def update
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
    @page_title = "new about"
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
    @about.destroy
    redirect_to admin_about_index_path
  end

  private

  def set_about
    @about = About.find(params[:id])
  end

  def about_params
    params.require(:about).permit(:title, :published, :text, :priority)
  end

end

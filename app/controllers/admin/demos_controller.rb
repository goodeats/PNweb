class Admin::DemosController < Admin::AdminController
  before_action :set_demo, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'demos', :admin_demos_path

  def index
    @demos = Demo.desc
    add_breadcrumb 'create demo', new_admin_demo_path
    @page_title = 'my demos'
  end

  def show
    add_breadcrumb @demo.title, admin_demo_path(@demo)
    @page_title = @demo.title
  end

  def edit
    add_breadcrumb @demo.title, admin_demo_path(@demo)
    add_breadcrumb 'edit', edit_admin_demo_path(@demo)
    @page_title = "edit #{@demo.title}"
  end

  def update
    if @demo.update(demo_params)
      flash[:success] = "updated #{@demo.title}!"
      redirect_to admin_demo_path(@demo)
    else
      render :edit
    end
  end

  def new
    @demo = Demo.new
    add_breadcrumb 'create demo'
    @page_title = 'new demo'
  end

  def create
    @demo = Demo.new(demo_params)
    if @demo.save
      redirect_to admin_demo_path(@demo)
    else
      render :new
    end
  end

  def destroy
    @demo.destroy
    redirect_to admin_demos_path
  end

  private

  def set_demo
    @demo = Demo.find_by_param(params[:id]) || Demo.find(params[:id])
  end

  def demo_params
    params.require(:demo).permit(:title, :published, :external, :url, :text)
  end

end

class Admin::ArticlesController < Admin::AdminController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'blog', :admin_articles_path

  def index
    @articles = Article.desc
    add_breadcrumb 'create blog', new_admin_article_path
    @page_title = 'my blogs'
  end

  def show
    add_breadcrumb @article.title, admin_article_path(@article)
    @page_title = @article.title
  end

  def edit
    add_breadcrumb @article.title, admin_article_path(@article)
    add_breadcrumb 'edit', edit_admin_article_path(@article)
    @page_title = "edit #{@article.title}"
  end

  def update
    if @article.update(article_params)
      flash[:success] = "updated #{@article.title}!"
      redirect_to admin_article_path(@article)
    else
      render :edit
    end
  end

  def new
    @article = Article.new
    add_breadcrumb 'create article'
    @page_title = "new blog"
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :published, :image_url, :image_alt, :text)
  end

end

class Admin::ArticlesController < ApplicationController

  add_breadcrumb 'admin', :admin_path
  add_breadcrumb 'blog', :admin_articles_path

  def index
    @articles = Article.all
    add_breadcrumb 'create blog', new_admin_article_path
  end

  def show
    @article = Article.find(params[:id])
    add_breadcrumb @article.title, admin_article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
    add_breadcrumb @article.title, admin_article_path(@article)
    add_breadcrumb 'edit', edit_admin_article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :published, :image_url, :image_alt, :text)
  end

end

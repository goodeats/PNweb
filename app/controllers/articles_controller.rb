class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_meta_articles
  before_action :set_article, :set_meta_article, only: [:show]
  include SetMetaTags

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'blog', :articles_path

  def index
    @articles = Article.published.desc
  end

  def show
    if @article.published
      add_breadcrumb @article.title, article_path(@article)
    else
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_meta_articles
    @page_title = 'blog'
    @page_description = "Blog by Pat Needham"
    @page_keywords = @page_keywords + keywords_articles
  end

  def set_meta_article
    @page_title = @article.title
    @page_description = "#{@article.title} | Blog by Pat Needham"
    @page_keywords = @page_keywords + keywords_articles
  end

  def keywords_articles
    ['blog', 'articles']
  end

end

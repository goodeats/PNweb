class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_meta_articles
  include SetMetaTags

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'blog', :articles_path

  def index
    @articles = Article.published.desc
  end

  private

  def set_meta_articles
    @page_title = 'blog'
    @page_description = "Blog by Pat Needham"
    @page_keywords = @page_keywords + keywords_articles
  end

  def keywords_articles
    ['blog', 'articles']
  end

end

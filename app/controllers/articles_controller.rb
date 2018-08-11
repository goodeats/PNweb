class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'blog', :articles_path

  def index
    @articles = Article.published.desc
    @page_title = 'blog'
    @page_description = "Blog by Pat Needham"
    @page_keywords = @page_keywords + ['blog', 'articles']
  end
end

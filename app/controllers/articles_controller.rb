class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  add_breadcrumb '🏠', :root_path
  add_breadcrumb 'blog', :articles_path

  def index
    @articles = Article.published.desc
  end
end

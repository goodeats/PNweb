class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.published
  end
end

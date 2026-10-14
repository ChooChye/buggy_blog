class HomeController < ApplicationController
  def index
    @article_count = Article.count
    @category_count = Category.count
  end
end

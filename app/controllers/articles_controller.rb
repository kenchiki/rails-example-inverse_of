class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article.blog, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, blog_attributes: %i[id title])
  end
end

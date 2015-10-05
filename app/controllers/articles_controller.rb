class ArticlesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
    
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
    @commentable = @article
    @comments    = @commentable.comments
    @comment     = Comment.new
  end

  def edit
  end

  def update
    if @article.update( article_params )
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  

private

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end

  def find_post
    @article = Article.find( params[:id] )
  end
end #ArticlesController
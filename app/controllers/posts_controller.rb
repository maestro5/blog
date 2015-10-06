class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :determine_class

  def index
    @posts = @current_class.all
  end
    
  def new
    @post = @current_class.new
    @avatar = Avatar.new
  end

  def create
    @post = @current_class.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @commentable = @post
    @assetable   = @post
    @comments    = @commentable.comments
    @comment     = Comment.new
    @assets      = @assetable.assets
    @asset       = Asset.new
  end

  def edit
  end

  def update
    if @post.update( post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  

private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end

  def find_post
    @post = Post.find( params[:id] )
  end

  def determine_class
    _resource = request.path.split('/')[1, 2]
    @current_class = _resource[0].singularize.classify.constantize
  end
end #PostsController
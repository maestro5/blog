class VideosController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end
    
  def new
    @video = Video.new
  end

  def create
    @video = Video.new( video_params )
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def show
    @commentable = @video
    @comments    = @commentable.comments
    @comment     = Comment.new
  end

  def edit
  end

  def update
    if @video.update( video_params )
      redirect_to videos_path
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end


private

  def video_params
    params.require(:video).permit(:title, :body, :author)
  end

  def find_post
    @video = Video.find( params[:id] )
  end
end #VideosController
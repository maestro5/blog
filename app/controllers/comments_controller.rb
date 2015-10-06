class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new( comment_params )
    if @comment.save
      redirect_to @commentable, notice: "Comment created"
    else
      render :new
    end
  end

private
  def load_commentable
    _resource, _id = request.path.split('/')[1, 2]
    @commentable = _resource.singularize.classify.constantize.find(_id)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :author_email, :body)
  end
end #CommentsController

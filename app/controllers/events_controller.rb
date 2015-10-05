class EventsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end
    
  def new
    @event = Event.new
  end

  def create
    @event = Event.new( event_params )
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @commentable = @event
    @comments    = @commentable.comments
    @comment     = Comment.new
  end

  def edit
  end

  def update
    if @event.update( event_params )
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:title, :body, :author, :description, :address, :start_at, :finish_at)
  end

  def find_post
    @event = Event.find( params[:id] )
  end

end #EventsController
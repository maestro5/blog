class MainsController < ApplicationController
  def index
    @articles = Article.first(3)
    @videos   = Video.first(3)
    @events   = Event.first(3)
  end
end
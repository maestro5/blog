class AvatarsController < ApplicationController
  before_action :load_assetable

  def index
    @assets = @assetable.avatar
  end

  def new
    @asset = @assetable.avatar.new
  end

  def create
    @asset = @assetable.avatar.new( asset_params )
    if @asset.save
      redirect_to @assetable, notice: "Asset created"
    else
      render :new
    end
  end

private
  def load_assetable
    resource, id = request.path.split('/')[1, 2]
    @assetable   = resource.singularize.classify.constantize.find(id)
  end

  def asset_params
    params.require(:avatar).permit(:filename)
  end
end #PicturesController
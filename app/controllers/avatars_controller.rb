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
    _resource, _id = request.path.split('/')[1, 2]
    @assetable   = _resource.singularize.classify.constantize.find(_id)
  end

  def asset_params
    params.require(:avatar).permit(:filename)
  end
end #PicturesController
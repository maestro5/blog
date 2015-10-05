class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :assets, as: :assetable, dependent: :destroy
  has_one :avatar, as: :assetable, dependent: :destroy
end
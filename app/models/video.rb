class Video < Post
  has_one :movie, as: :assetable, dependent: :destroy
end
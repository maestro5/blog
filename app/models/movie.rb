class Movie < Asset
  mount_uploader :data, MovieUploader, mount_on: :filename
end
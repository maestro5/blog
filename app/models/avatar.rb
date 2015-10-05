class Avatar < Asset
  mount_uploader :data, AvatarUploader, mount_on: :filename
end
class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :display do
    process :resize_to_fill => [200, 200]
  end

  version :thumb do
    process :resize_to_fit => [80, 80]
  end

end

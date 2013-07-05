# encoding: utf-8

class PhotoAlbum::PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "system/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :carousel do
    process :resize_to_fill => [800, 600]
  end

  version :thumb do
    process :resize_to_fit => [120, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

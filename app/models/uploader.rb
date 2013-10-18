class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    'images'
  end

  process resize_to_limit: [800, 800]

  version :thumb do
    process resize_to_fill: [100, 100]
  end
end

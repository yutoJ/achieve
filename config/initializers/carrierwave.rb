CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECREST_ACCESS_KEY"],
    region: 'ap-northeast-1',
    path_style: true,
  }

  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = ENV["AWS_S3_PD"]
      config.asset_host = ENV["AWS_S3_PD_URL"]
    when 'development'
      config.fog_directory = ENV["AWS_S3_DEV"]
      config.asset_host = ENV["AWS_S3_DEV_URL"]
    #when 'test'
    #  config.fog_directory = 'achieve-t'
    #  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/achieve-t'
    end
  end

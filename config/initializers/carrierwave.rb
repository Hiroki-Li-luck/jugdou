unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA4XRDO4OHTLBPNQG5',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'jugdou'
    config.cache_storage = :fog
  end
end
unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAJPPHSF26XJS7QCYQ',
      aws_secret_access_key: '',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'jugdou'
    config.cache_storage = :fog
  end
end
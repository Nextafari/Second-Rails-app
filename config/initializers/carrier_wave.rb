if Rails.env.production?
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp') # adding these...
    config.cache_dir = 'carrierwave' # ...two lines
    
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider => 'AWS',
      :aws_access_key_id      => ENV['S3_ACCESS_KEY'],                     # required
      :aws_secret_access_key  => ENV['S3_SECRET_KEY'],                    # required
      :region                 => 'us-east-2'
    }
    config.fog_directory = ENV['S3_BUCKET']
  end
end


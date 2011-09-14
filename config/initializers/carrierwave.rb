CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = true
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider           => 'Rackspace',
      :rackspace_username => 'YOUR_RACKSPACE_USERNAME',
      :rackspace_api_key  => 'YOUR_RACKSPACE_API_KEY'
    }
    config.fog_directory = 'blog.uploads'
    config.fog_host = 'YOUR_RACKSPACE_CDN_URL'
  end
end
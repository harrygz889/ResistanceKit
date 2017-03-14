require 'carrierwave/orm/activerecord'

if Rails.env.production?
  CarrierWave.configure do |config|

    config.fog_provider = 'fog/google'

    config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     Rails.application.secrets.google_storage_access_key_id,
      google_storage_secret_access_key: Rails.application.secrets.google_storage_secret_access_key
    }

    config.fog_directory = 'resistkit'
  end
end

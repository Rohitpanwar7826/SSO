require 'sidekiq'
require 'apartment/sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/2' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/2' }

  # The client middleware for Apartment is not needed
end
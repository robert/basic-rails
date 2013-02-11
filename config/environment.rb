# Load the rails application
require File.expand_path('../application', __FILE__)

# load all application configuration settings
base_config = YAML.load_file("#{Rails.root.to_s}/config/config.yml")[Rails.env]

# override config variables where required
unless Rails.env.test? || Rails.env.production?
  base_config['mailgun']['domain'] = ENV['COPYIN_DEV_MG_DOMAIN'] if ENV['COPYIN_DEV_MG_DOMAIN']
  base_config['mailgun']['address'] = ENV['COPYIN_DEV_MG_ADDRESS'] if ENV['COPYIN_DEV_MG_ADDRESS']
  base_config['mailgun']['username'] = ENV['COPYIN_DEV_MG_USERNAME'] if ENV['COPYIN_DEV_MG_USERNAME']
  base_config['mailgun']['password'] = ENV['COPYIN_DEV_MG_PASSWORD'] if ENV['COPYIN_DEV_MG_PASSWORD']
  base_config['mailgun']['api_key'] = ENV['COPYIN_DEV_MG_API_KEY'] if ENV['COPYIN_DEV_MG_API_KEY']
end
CONFIG = base_config

# Initialize the rails application
BlogPact::Application.initialize!

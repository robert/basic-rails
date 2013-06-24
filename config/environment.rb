# Load the rails application
require File.expand_path('../application', __FILE__)

# load all application configuration settings
CONFIG = YAML.load_file("#{Rails.root.to_s}/config/config.yml")[Rails.env]

# Initialize the rails application
CanbanCodeReview::Application.initialize!

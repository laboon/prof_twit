# Load the rails application
require File.expand_path('../application', __FILE__)

config.gem 'stemmer'
config.gem 'classifier'
config.gem 'twitter'

# Initialize the rails application
ProfTwit::Application.initialize!

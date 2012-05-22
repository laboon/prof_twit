# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ProfTwit::Application.initialize!
config.gem 'stemmer', :lib => 'lingua/stemmer'
config.gem 'classifier', :lib => 'classifier'
config.gem 'twitter'

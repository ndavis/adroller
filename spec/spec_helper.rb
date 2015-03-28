require 'adroll'
require 'byebug'
require 'factory_girl'
require 'webmock/rspec'
require 'support/vcr_setup'
require 'yaml'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.extend VCR::RSpec::Macros
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

environment_variables = YAML.load_file 'config/application.yml'

environment_variables['production'].each do |key, value|
  ENV[key] = value
end

require 'adroll'
require 'byebug'
require 'factory_girl'
require 'webmock/rspec'
require 'support/vcr_setup'
require 'yaml'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['ADROLL_USERNAME'] = 'USERNAME'
ENV['ADROLL_PASSWORD'] = 'PASSWORD'
ENV['ADROLL_ORGANIZATION_EID'] = 'ORG123XYZ'

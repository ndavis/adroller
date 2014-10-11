require 'adroll'
require 'byebug'
require 'factory_girl'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

AdRoll::Api.const_set('Service1', Class.new(AdRoll::Api::Service))
AdRoll::Api.const_set('Service2', Class.new(AdRoll::Api::Service))

ENV['USERNAME'] = 'USERNAME'
ENV['PASSWORD'] = 'PASSWORD'

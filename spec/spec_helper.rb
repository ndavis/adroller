require 'adroll'
require 'byebug'
require 'factory_girl'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['USERNAME'] = 'USERNAME'
ENV['PASSWORD'] = 'PASSWORD'


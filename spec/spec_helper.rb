require 'adroll'
require 'webmock/rspec'
require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['USERNAME'] = 'USERNAME'
ENV['PASSWORD'] = 'PASSWORD'


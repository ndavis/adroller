require 'adroller'
require 'byebug'
require 'factory_girl'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    stub_request(:any, /https:\/\/USERNAME:PASSWORD@api.adroll.com\/v1\//)
      .to_return(status: [200, 'OK'], body: { results: {} }.to_json)
  end
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

ENV['ADROLL_USERNAME'] = 'USERNAME'
ENV['ADROLL_PASSWORD'] = 'PASSWORD'
ENV['ADROLL_ORGANIZATION_EID'] = 'ORG123XYZ'

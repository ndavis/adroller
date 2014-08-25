require 'spec_helper'
require 'yaml'

describe AdRoll::Api do
  before :each do
    AdRoll::Api.version('v1')
  end

  it 'should get username from environment variable' do
    expect(AdRoll::Api.user_name).to eq 'USERNAME'
  end

  it 'should get password for environment variable' do
    expect(AdRoll::Api.password).to eq 'PASSWORD'
  end

  it 'should return the base url for api endpoints' do
    expect(AdRoll::Api.base_url).to eq 'https://api.adroll.com'
  end

  it 'should return the latest api version' do
    expect(AdRoll::Api.version).to eq 'v1'
  end

  it 'should set the api version' do
    AdRoll::Api.version('v2')
    expect(AdRoll::Api.version).to eq 'v2'
  end

  it 'should return the full root url' do
    expect(AdRoll::Api.root_url).to eq 'https://api.adroll.com/v1'
  end

  describe 'Api Specification Yaml' do

    it 'should read and parse the api yaml file' do
      expect(AdRoll::Api.parse_yaml).to be_a Hash
    end

    it 'should have a key for each Service subclass' do
      AdRoll::Api.api_services.each do |service|
        expect(AdRoll::Api.parse_yaml.keys.include?(service.to_s.demodulize)).to be true
      end
    end

    it 'should define the methods specified by a service' do
      AdRoll::Api.define_methods_for_services
      expect(AdRoll::Api::Organization.respond_to?(:get_advertisables)).to be true
      expect(AdRoll::Api::Organization.respond_to?(:no_method)).to be false
    end
  end
end

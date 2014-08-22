require 'spec_helper'

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
end

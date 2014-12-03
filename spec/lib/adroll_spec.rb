require 'spec_helper'
require 'yaml'

describe AdRoll::Api do

  it 'should get username from environment variable' do
    expect(AdRoll::Api.user_name).to eq 'USERNAME'
  end

  it 'should get password for environment variable' do
    expect(AdRoll::Api.password).to eq 'PASSWORD'
  end

  it 'should return the base url for api endpoints' do
    expect(AdRoll::Api.base_url).to eq 'https://api.adroll.com/v1'
  end

end

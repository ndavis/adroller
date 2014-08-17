require 'spec_helper'

describe AdRoll::Api::Service do

  it 'should get username from environment variable' do
    expect(AdRoll::Api::Service.user_name).to eq "USERNAME"
  end

  it 'should get password for environment variable' do
    expect(AdRoll::Api::Service.password).to eq "PASSWORD"
  end
end

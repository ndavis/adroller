require 'spec_helper'

describe AdRoll::Api::Organization do

  subject { described_class }

  describe '::get' do
    let!(:basic_auth) { "#{AdRoll::Api.user_name}:#{AdRoll::Api.password}" }
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/organization/get" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::get_advertisables' do
    let!(:basic_auth) { "#{AdRoll::Api.user_name}:#{AdRoll::Api.password}" }
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/organization/get_advertisables" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_advertisables(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::get_billing_methods' do
    let!(:basic_auth) { "#{AdRoll::Api.user_name}:#{AdRoll::Api.password}" }
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/organization/get_billing_methods" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_billing_methods(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::get_users' do
    let!(:basic_auth) { "#{AdRoll::Api.user_name}:#{AdRoll::Api.password}" }
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/organization/get_users" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.get_users(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::reset' do
    let!(:basic_auth) { "#{AdRoll::Api.user_name}:#{AdRoll::Api.password}" }
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/organization/reset" }

    let!(:params) do
      {
        organization: 'abc123'
      }
    end

    it 'calls the api with the correct params' do
      subject.reset(organization: 'abc123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end

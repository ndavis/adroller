require 'spec_helper'

describe AdRoll::Api::Ad do

  let!(:basic_auth) { "#{AdRoll::Api.user_name}:#{AdRoll::Api.password}" }

  subject { described_class }

  describe '::clone' do
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/ad/clone" }

    let!(:params) do
      {
        name: 'name',
        headline: 'headline',
        body: 'body'
      }
    end

    it 'calls the api with the correct params' do
      subject.clone(name: 'name', headline: 'headline', body: 'body')
      expect(WebMock).to have_requested(:post, request_uri).with(body: params)
    end
  end

  describe '::create' do
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/ad/create" }
    let!(:params) do
      { advertisable: 'advertisable',
        file: 'ANBLE5432',
        dynamic_template_id: '1'
      }
    end

    it 'calls the api with the correct params' do
      subject.create(advertisable: 'advertisable', file: 'ANBLE5432', dynamic_template_id: 1)
      expect(WebMock).to have_requested(:post, request_uri).with(body: params)
    end
  end

  describe '::edit' do
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/ad/edit" }
    let!(:params) do
      { ad: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.edit(ad: 'AD123')
      expect(WebMock).to have_requested(:put, request_uri).with(body: params)
    end
  end

  describe '::get' do
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/ad/get" }
    let!(:params) do
      { ad: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.get(ad: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end

  describe '::set_outline' do
    let!(:request_uri) { "https://#{basic_auth}@api.adroll.com/v1/ad/set_outline" }
    let!(:params) do
      { ad: 'AD123' }
    end

    it 'calls the api with the correct params' do
      subject.set_outline(ad: 'AD123')
      expect(WebMock).to have_requested(:get, request_uri).with(query: params)
    end
  end
end

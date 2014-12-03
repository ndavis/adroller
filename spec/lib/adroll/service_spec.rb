require 'spec_helper'

describe AdRoll::Api::Service do
  let(:service_url) { AdRoll::Api::Service.service_url }

  let(:request_params) do
    { param_1: '1', param_2: '2' }
  end

  let(:request_response) do
    { response_1: 123, response_2: 456 }.to_json
  end

  subject { FactoryGirl.build(:service) }

  describe '::initialize' do
    let!(:new_service) { FactoryGirl.build(:service, attribute_1: 'value 1') }

    it 'should create specified attributes' do
      expect(new_service.respond_to?(:attribute_1)).to be true
      expect(new_service.respond_to?(:attribute_2)).to be false
    end

    it 'should set the value for the specified attributes' do
      expect(new_service.attribute_1).to eq 'value 1'
    end
  end

  describe '::service_url' do
    it 'should return its service url' do
      expect(AdRoll::Api::Service.service_url).to eq 'https://api.adroll.com/v1/service'
    end
  end

  describe '#create' do
    before do
      stub_request(:post, "#{service_url}/create")
        .with(query: request_params)
        .to_return(status: 200, body: request_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.create(request_params)
      expect(WebMock).to have_requested(:post, "#{service_url}/create")
        .with(query: request_params)
    end

    it 'should return an instance of the Service object' do
      new_service = AdRoll::Api::Service.create(request_params)
      expect(new_service).to be_an_instance_of AdRoll::Api::Service
    end
  end

  describe '#edit' do
    before do
      stub_request(:put, "#{service_url}/edit")
        .with(query: request_params)
        .to_return(status: 200, body: request_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.edit(request_params)
      expect(WebMock).to have_requested(:put, "#{service_url}/edit")
        .with(query: request_params)
    end

    it 'should return an instance of the Service object' do
      edited_service = AdRoll::Api::Service.edit(request_params)
      expect(edited_service).to be_an_instance_of AdRoll::Api::Service
    end
  end

  describe '#get' do
    before do
      stub_request(:get, "#{service_url}/get")
        .with(query: request_params)
        .to_return(status: 200, body: request_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.get(request_params)
      expect(WebMock).to have_requested(:get, "#{service_url}/get")
        .with(query: request_params)
    end

    it 'should return an instance of the Service object' do
      existing_service = AdRoll::Api::Service.get(request_params)
      expect(existing_service).to be_an_instance_of AdRoll::Api::Service
    end
  end

  describe '::define_service_method' do

    it 'should create the class method specified' do
      AdRoll::Api::Service.define_service_method('my_method', {return_type: 'Array'})
      expect(AdRoll::Api::Service.respond_to?(:my_method)).to be true
    end
  end
end

require 'spec_helper'

describe AdRoll::Api::Service do
  let(:service){ FactoryGirl.build(:service) }
  let(:service_object){ FactoryGirl.build(:service, {attr_1: 'value 1', attr_2: 'value 2'}) }

  let(:request_params) do
    {param_1: '1', param_2: '2'}
  end

  let(:request_response) do
    {response_1: 123, response_2: 456 }.to_json
  end

  it 'should return its service url' do
    expect(AdRoll::Api::Service.service_url).to eq 'https://api.adroll.com/v1/service'
  end

  it 'should create attributes for each hash key/value pair' do
    expect(service_object.respond_to?(:attr_1)).to be true
    expect(service_object.respond_to?(:attr_2)).to be true
    expect(service_object.respond_to?(:attr_3)).to be false
    expect(service_object.attr_1).to eq 'value 1'
    expect(service_object.attr_2).to eq 'value 2'
  end

  describe '#create' do
    before do
      stub_request(:post, "#{AdRoll::Api::Service.service_url}/create")
        .with(query: request_params)
        .to_return(:status => 200, :body => request_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.create(request_params)
      expect(WebMock).to have_requested(:post, "#{AdRoll::Api::Service.service_url}/create").with(query: request_params)
    end

    it 'should return an instance of the Service object' do
      new_service = AdRoll::Api::Service.create(request_params)

      expect(new_service.respond_to?(:response_1)).to be true
      expect(new_service.respond_to?(:response_2)).to be true
      expect(new_service.respond_to?(:response_3)).to be false
      expect(new_service.response_1).to eq 123
      expect(new_service.response_2).to eq 456
    end
  end

  describe '#edit' do
    before do
      stub_request(:put, "#{AdRoll::Api::Service.service_url}/edit")
        .with(query: request_params)
        .to_return(:status => 200, :body => request_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.edit(request_params)
      expect(WebMock).to have_requested(:put, "#{AdRoll::Api::Service.service_url}/edit").with(query: request_params)
    end

    it 'should return an instance of the Service object' do
      new_service = AdRoll::Api::Service.edit(request_params)

      expect(new_service.respond_to?(:response_1)).to be true
      expect(new_service.respond_to?(:response_2)).to be true
      expect(new_service.respond_to?(:response_3)).to be false
      expect(new_service.response_1).to eq 123
      expect(new_service.response_2).to eq 456
    end
  end

  describe '#get' do
    before do
      stub_request(:get, "#{AdRoll::Api::Service.service_url}/get")
        .with(query: request_params)
        .to_return(:status => 200, :body => request_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.get(request_params)
      expect(WebMock).to have_requested(:get, "#{AdRoll::Api::Service.service_url}/get").with(query: request_params)
    end

    it 'should return an instance of the Service object' do
      new_service = AdRoll::Api::Service.get(request_params)

      expect(new_service.respond_to?(:response_1)).to be true
      expect(new_service.respond_to?(:response_2)).to be true
      expect(new_service.respond_to?(:response_3)).to be false
      expect(new_service.response_1).to eq 123
      expect(new_service.response_2).to eq 456
    end
  end

  describe '#define_service_method' do
    it 'should create the class method specified' do
      AdRoll::Api::Service.define_service_method('my_method')

      expect(AdRoll::Api::Service.respond_to?(:my_method)).to be true
      expect(AdRoll::Api::Service.respond_to?(:bad_method)).to be false
      expect(service_object.respond_to?(:my_method)).to be false
      expect(AdRoll::Api::Service.instance_methods.include?(:my_method)).to be false
      expect(AdRoll::Api::Service.singleton_methods.include?(:my_method)).to be true
    end
  end
end

require 'spec_helper'

describe AdRoll::Api::Service do
  let(:service){ FactoryGirl.build(:service) }
  let(:service_object){ FactoryGirl.build(:service, {attr_1: 'value 1', attr_2: 'value 2'}) }

  let(:create_params) do
    {param_1: '1', param_2: '2'}
  end

  let(:create_response) do
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
        .with(query: create_params)
        .to_return(:status => 200, :body => create_response)
    end

    it 'should make a http request with given parameters' do
      AdRoll::Api::Service.create(create_params)
      expect(WebMock).to have_requested(:post, "#{AdRoll::Api::Service.service_url}/create").with(query: create_params)
    end

    it 'should return an instance of the Service object' do
      new_service = AdRoll::Api::Service.create(create_params)

      expect(new_service.respond_to?(:response_1)).to be true
      expect(new_service.respond_to?(:response_2)).to be true
      expect(new_service.respond_to?(:response_3)).to be false
      expect(new_service.response_1).to eq 123
      expect(new_service.response_2).to eq 456
    end
  end
end

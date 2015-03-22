require 'spec_helper'

describe AdRoll::Api::Service do

  subject { described_class.new }

  describe '::service_url' do
    it 'should return its service url' do
      expect(subject.class.service_url).to eq 'https://api.adroll.com/v1/service'
    end
  end

  describe '::basic_auth' do
    it 'should return the username and password' do
      expect(subject.class.basic_auth).to eq(username: AdRoll::Api.user_name, password: AdRoll::Api.password)
    end
  end

  describe '#respond_to?' do

    context 'when method name does not exist in api_metadata' do
      before do
        allow(subject).to receive(:api_metadata).and_return([{}])
        allow(subject).to receive(:service_attributes).and_return([])
      end

      it 'should return false' do
        expect(subject.respond_to?(:not_a_method)).to be false
      end
    end

    context 'when method name exists in api_metadata' do
      before do
        allow(subject).to receive(:api_metadata).and_return([{ endpoint: :a_method }])
        allow(subject).to receive(:service_attributes).and_return([])
      end

      it 'should return true' do
        expect(subject.respond_to?(:a_method)).to be true
      end
    end

    context 'when attribute name does not exist in api_attributes' do
      before do
        allow(subject).to receive(:api_metadata).and_return([{}])
        allow(subject).to receive(:service_attributes).and_return([])
      end

      it 'should return false' do
        expect(subject.respond_to?(:not_an_attribute)).to be false
      end
    end

    context 'when attribute name exists in api_attributes' do
      before do
        allow(subject).to receive(:api_metadata).and_return([{}])
        allow(subject).to receive(:service_attributes).and_return([:an_attribute])
      end

      it 'should return true' do
        expect(subject.respond_to?(:an_attribute)).to be true
      end
    end
  end

  describe '#method_missing' do
    before do
      allow(subject).to receive(:respond_to?).with(:some_method_name).and_return(true)
      allow(subject).to receive(:respond_to?).with(:not_this_method_name).and_return(false)
    end

    context 'when the Service responds_to the method name' do

      it 'should define the method' do
        subject.some_method_name
        expect(subject.methods).to include(:some_method_name)
      end

    end

    context 'when the Service does not respond to the method name' do
      it 'should not define the method' do
        expect { subject.not_this_method_name }.to raise_error(NoMethodError)
      end
    end
  end

  xdescribe '#create' do
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

  xdescribe '#edit' do
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

  xdescribe '#get' do
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
end

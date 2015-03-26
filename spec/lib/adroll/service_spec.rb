require 'spec_helper'

describe AdRoll::Api::Service do

  subject { described_class }

  describe '::service_url' do
    it 'should return its service url' do
      expect(subject.service_url).to eq 'https://api.adroll.com/v1/service'
    end
  end

  describe '::basic_auth' do
    it 'should return the username and password' do
      expect(subject.basic_auth)
        .to eq(username: AdRoll::Api.user_name, password: AdRoll::Api.password)
    end
  end

  describe '::respond_to?' do

    context 'when method name does not exist in api_endpoints' do
      before do
        stub_const("#{subject}::API_METADATA", [{}])
      end

      it 'should return false' do
        expect(subject.respond_to?(:not_a_method)).to be false
      end
    end

    context 'when method name exists in api_endpoints' do
      before do
        stub_const("#{subject}::API_METADATA",  [{ endpoint: :a_method }])
      end

      it 'should return true' do
        expect(subject.respond_to?(:a_method)).to be true
      end
    end
  end

  describe '#respond_to?' do

    context 'when attribute name does not exist in SERVICE_ATTRIBUTES' do
      before do
        stub_const("#{subject}::SERVICE_ATTRIBUTES", [])
      end

      it 'should return false' do
        expect(subject.new.respond_to?(:not_an_attribute)).to be false
      end
    end

    context 'when attribute name exists in SERVICE_ATTRIBUTES' do
      before do
        stub_const("#{subject}::SERVICE_ATTRIBUTES", [:an_attribute])
      end

      it 'should return true' do
        expect(subject.new.respond_to?(:an_attribute)).to be true
      end
    end
  end

  describe '::method_missing' do
    before do
      stub_const(
        "#{subject}::API_METADATA",
        [{ endpoint: :some_method_name, request_method: :get }]
      )

      allow(HTTParty).to receive(:get).and_return('{}')
    end

    context 'when the Service responds to the method name' do

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

  describe '#missing_method' do
    subject { described_class.new }

    before do
      stub_const("#{subject.class}::SERVICE_ATTRIBUTES", [:an_attribute])
    end

    context 'when the Service responds to the attribute name' do
      it 'should define the attr_reader for the attribute' do
        expect(subject.an_attribute).to eq nil
      end

      it 'should define the attr_writter for the attribute' do
        subject.an_attribute = 1
        expect(subject.an_attribute).to eq 1
      end
    end

    context 'when the Service does not respond to the attribute name' do
      it 'should not define the attr_reader for the attribute' do
        expect { subject.not_an_attribute }.to raise_error(NoMethodError)
      end
      it 'should not define the attr_writer for the attribute' do
        expect { subject.not_an_attribute = 1 }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#initialize' do
    before do
      stub_const("#{subject}::SERVICE_ATTRIBUTES", [:an_attribute])
    end

    it 'should set the instance variables' do
      service = subject.new(an_attribute: 1)
      expect(service.an_attribute).to eq 1

    end
  end

  describe '#attributes' do
    before do
      stub_const("#{subject}::SERVICE_ATTRIBUTES", [:an_attribute])
    end

    it 'should return the instance variables in a Hash' do
      service = subject.new(an_attribute: 1)
      expect(service.attributes).to match(an_attribute: 1)
    end
  end
end

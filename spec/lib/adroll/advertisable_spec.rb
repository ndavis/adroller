require 'spec_helper'

VCR.turn_on!

describe AdRoll::Api::Advertisable do

  vcr_options = {
    match_requests_on: [:host, :path]
  }

  subject { described_class }

  describe '::create', vcr: vcr_options.merge(cassette_name: 'advertisable::create') do
    it 'should create an instance of Advertisable' do
      advertisable = subject.create(name: 'Test Advertisable', organization: AdRoll::Api.organization_eid)
      expect(advertisable).to be_a AdRoll::Api::Advertisable
    end
  end
end

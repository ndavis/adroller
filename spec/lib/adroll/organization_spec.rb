require 'spec_helper'

VCR.turn_on!

describe AdRoll::Api::Organization do

  vcr_options = {
    cassette_name: 'organization::get',
    match_requests_on: [:host, :path]
  }

  subject { described_class }

  describe '::get', vcr: vcr_options do
    it 'should create an instance of Organization' do
      organization = subject.get(organization: AdRoll::Api.organization_eid)
      expect(organization).to be_a AdRoll::Api::Organization
    end
  end

end

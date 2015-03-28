require 'vcr'

VCR.configure do |cassette|
  cassette.default_cassette_options =
    { serialize_with: :json }

  cassette.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  cassette.hook_into :webmock
  cassette.configure_rspec_metadata!
end

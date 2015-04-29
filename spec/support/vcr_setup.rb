require 'vcr'

VCR.configure do |cassette|
  cassette.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  cassette.hook_into :webmock
  cassette.configure_rspec_metadata!
end

VCR.turn_off!

VCR.extend Module.new {
  def use_cassette(*args)
    VCR.turn_on!
    super
    VCR.turn_off!
  end
}

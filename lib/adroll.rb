require 'httparty'
require 'byebug'

Dir[File.dirname(__FILE__) + '/adroll/*.rb'].each do |file|
  require file
end

module AdRoll
  module Api
    def self.user_name
      ENV['ADROLL_USERNAME']
    end

    def self.password
      ENV['ADROLL_PASSWORD']
    end

    def self.organization_eid
      ENV['ADROLL_ORGANIZATION_EID']
    end

    def self.base_url
      'https://api.adroll.com/v1'
    end
  end
end

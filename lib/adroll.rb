require 'httparty'
require 'httmultiparty'

require 'adroll/ad'
require 'adroll/adgroup'
require 'adroll/advertisable'
require 'adroll/campaign'
require 'adroll/event'
require 'adroll/invoice'
require 'adroll/mobile_app'
require 'adroll/mobile_rule'
require 'adroll/organization'
require 'adroll/payment_method'
require 'adroll/pixel'
require 'adroll/report'
require 'adroll/rollcrawl_configuration'
require 'adroll/rule'
require 'adroll/segment'
require 'adroll/service'
require 'adroll/user'

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

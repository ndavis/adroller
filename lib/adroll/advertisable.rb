require 'adroll/service'

module AdRoll
  module Api

    class Advertisable < Service

      def self.service_url
        "/advertisable"
      end

    end
  end
end

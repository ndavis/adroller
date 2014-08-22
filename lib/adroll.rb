require 'httparty'

Dir[File.dirname(__FILE__) + '/adroll/*.rb'].each do |file|
  require file
end

module AdRoll
  module Api
      @version = 'v1'

      def self.user_name
        ENV['USERNAME']
      end

      def self.password
        ENV['PASSWORD']
      end

      def self.base_url
        'https://api.adroll.com'
      end

      def self.version(value = nil)
        @version = value ? value : @version
      end

      def self.root_url
        File.join(base_url, version)
      end
  end
end

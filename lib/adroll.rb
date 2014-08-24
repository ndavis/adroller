require 'httparty'

Dir[File.dirname(__FILE__) + '/adroll/*.rb'].each do |file|
  require file
end

module AdRoll
  module Api
    @version = 'v1'

    class << self

      def user_name
        ENV['USERNAME']
      end

      def password
        ENV['PASSWORD']
      end

      def base_url
        'https://api.adroll.com'
      end

      def version(value = nil)
        @version = value ? value : @version
      end

      def root_url
        File.join(base_url, version)
      end
    end
  end
end

require 'httparty'
require 'byebug'
require 'yaml'

Dir[File.dirname(__FILE__) + '/adroll/*.rb'].each do |file|
  require file
end

module AdRoll
  module Api

    class << self
      def user_name
        ENV['USERNAME']
      end

      def password
        ENV['PASSWORD']
      end

      def base_url
        'https://api.adroll.com/v1'
      end

      def api_services
        [
          Ad, AdGroup, Advertisable, Campaign, Event, Invoice, MobileApp,
          Organization, PaymentMethod, Pixel, Report, Rule, Segment, User
        ]
      end

      def define_methods_for_services(yaml_file)
        YAML.load_file(yaml_file).each do |service_class, method_list|
          next if method_list.nil?
          method_list.each do |method_spec|

            method_name =  method_spec.keys.first
            method_attrs = method_spec[method_name]

            AdRoll::Api
              .const_get(service_class)
              .define_service_method(method_name, method_attrs)
          end
        end
      end
    end
  end
end

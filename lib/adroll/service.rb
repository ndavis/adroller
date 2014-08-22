module AdRoll
  module Api
    class Service
      include HTTParty

      def initialize(params)
        params.each do |key, value|
          self.class.send(:attr_accessor, key)
          instance_variable_set("@#{key}", value)
        end
      end

      def self.service_url
        File.join(AdRoll::Api.root_url, self.to_s.demodulize.downcase)
      end

      def self.create(params={})
        self.post("#{service_url}#{__method__}", {query: params})
      end

    end
  end
end

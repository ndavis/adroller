module AdRoll
  module Api
    class Service
      include HTTParty

      def self.service_url
        File.join(AdRoll::Api.base_url, to_s.demodulize.downcase)
      end

      def self.basic_auth
        {username: AdRoll::Api.user_name, password: AdRoll::Api.password}
      end

      def respond_to?(method_name, include_all = false)
        if api_endpoints.map{|hash| hash[:method_name] }.flatten.include?(method_name) ||
          api_attributes.include?(method_name)
          true
        else
          super
        end
      end

      def method_missing(method_name, *args, &block)
        if respond_to?(method_name)
          define_singleton_method(method_name) do
          end
        else
          super
        end
      end

      private

      def api_endpoints
        [{}]
      end

      def api_attributes
        []
      end

      #def create(params = {})
      #request_url = File.join(service_url, __method__.to_s)
      #response = post(request_url, query: params)

      #new(JSON.parse(response))
      #end

      #def edit(params = {})
      #request_url = File.join(service_url, __method__.to_s)
      #response = put(request_url, query: params)
      #new(JSON.parse(response))
      #end

      #def get(params = {})
      #request_url = File.join(service_url, __method__.to_s)
      #response = HTTParty.get(request_url, query: params)
      #new(JSON.parse(response))
      #end

      #def define_service_method(method_name, method_attributes)
      #define_singleton_method(method_name) do

      #end
      #end
    end
  end
end

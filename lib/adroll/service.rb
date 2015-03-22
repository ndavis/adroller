module AdRoll
  module Api
    class Service
      include HTTParty

      def respond_to?(method_name, include_all = false)
        if api_endpoints.include?(method_name) ||
          service_attributes.include?(method_name)
          true
        else
          super
        end
      end

      def method_missing(method_name, *args, &block)
        if respond_to?(method_name)

          define_singleton_method(method_name) do |*request_params|
            call_api(method_name, request_params)
          end
        else
          super
        end
      end

      private

      def self.service_url
        File.join(AdRoll::Api.base_url, to_s.demodulize.downcase)
      end

      def self.basic_auth
        { username: AdRoll::Api.user_name, password: AdRoll::Api.password }
      end

      def api_metadata
        [{}]
      end

      def service_attributes
        []
      end

      def api_endpoints
        api_metadata.map { |hash| hash[:endpoint] }.flatten
      end

      def request_method(_endpoint_name)
        api_metadata
          .select { |metadata| metadata.keys.include?(enpoint_name) }[:request_method]
      end

      def call_api(endpoint, request_params)
        request_uri = File.join(service_url, endpoint)
        response = HTTParty.send(request_method(endpoint), [request_uri, request_params])
        JSON.parse(response)
      end

      # def create(params = {})
      # request_url = File.join(service_url, __method__.to_s)
      # response = post(request_url, query: params)

      # new(JSON.parse(response))
      # end

      # def edit(params = {})
      # request_url = File.join(service_url, __method__.to_s)
      # response = put(request_url, query: params)
      # new(JSON.parse(response))
      # end

      # def get(params = {})
      # request_url = File.join(service_url, __method__.to_s)
      # response = HTTParty.get(request_url, query: params)
      # new(JSON.parse(response))
      # end

      # def define_service_method(method_name, method_attributes)
      # define_singleton_method(method_name) do

      # end
      # end
    end
  end
end

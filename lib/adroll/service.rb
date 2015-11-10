module AdRoll
  module Api
    class Service
      def self.service_url
        File.join(AdRoll::Api.base_url, to_s.demodulize.downcase)
      end

      def self.basic_auth
        { username: AdRoll::Api.user_name, password: AdRoll::Api.password }
      end

      def self.call_api(request_method, endpoint, query_params)
        request_uri = File.join(service_url, endpoint.to_s)

        response = HTTParty.send(request_method, request_uri,
                                 basic_auth: basic_auth, query: query_params)

        begin
          JSON.parse(response.body).fetch('results', {})
        rescue JSON::ParserError
          { error: 'JSON::ParserError', response: response.body }
        end
      end

      private_class_method :service_url, :basic_auth, :call_api
    end
  end
end

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

        if request_method == :get
          response = HTTParty.send(request_method, request_uri,
                                   basic_auth: basic_auth, query: query_params, debug_output: $stdout)
        else
          if request_uri == 'https://api.adroll.com/v1/ad/create'
            response = HTTMultiParty.send(request_method, request_uri,
                                          basic_auth: basic_auth, body: query_params, debug_output: $stdout)

          else
            response = HTTParty.send(request_method, request_uri,
                                     basic_auth: basic_auth, body: query_params, debug_output: $stdout)
          end
        end

        begin
          JSON.parse(response.body)
        rescue JSON::ParserError
          { error: 'JSON::ParserError', response: response.body }
        end
      end

      private_class_method :service_url, :basic_auth, :call_api
    end
  end
end

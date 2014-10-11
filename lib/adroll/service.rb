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

      class << self
        def service_url
          File.join(AdRoll::Api.root_url, to_s.demodulize.downcase)
        end

        def create(params = {})
          request_url = File.join(service_url, __method__.to_s)
          response = post(request_url, query: params)

          new(JSON.parse(response))
        end

        def edit(params = {})
          request_url = File.join(service_url, __method__.to_s)
          response = put(request_url, query: params)
          new(JSON.parse(response))
        end

        def get(params = {})
          request_url = File.join(service_url, __method__.to_s)
          response = HTTParty.get(request_url, query: params)
          new(JSON.parse(response))
        end

        def define_service_method_hash(method_name)
          define_singleton_method(method_name) do
            {}
          end
        end

        def define_service_method_array(method_name)
          define_singleton_method(method_name) do
            []
          end
        end

        def define_service_method(method_name, return_type = 'Hash')
          case return_type
          when 'Array'

            define_service_method_array(method_name)
          when 'Hash'

            define_service_method_hash(method_name)
          else
            define_singleton_method(method_name) do

            end
          end
        end
      end
    end
  end
end

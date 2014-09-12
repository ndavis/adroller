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
          File.join(AdRoll::Api.root_url, self.to_s.demodulize.downcase)
        end

        def create(params={})
          response = post(File.join(service_url, __method__.to_s), {query: params})
          new(JSON.parse(response))
        end

        def edit(params={})
          response = put(File.join(service_url, __method__.to_s), {query: params})
          new(JSON.parse(response))
        end

        def get(params={})
          response = HTTParty.get(File.join(service_url, __method__.to_s), {query: params})
          new(JSON.parse(response))
        end

        def define_service_method(method_name, return_type = 'Hash')

          case return_type
          when 'Array'
            define_singleton_method(method_name) do
              []
            end

         when 'Hash'
            define_singleton_method(method_name) do
              {}
            end

          else
            define_singleton_method(method_name) do

            end
          end
        end
      end
    end

  end
end

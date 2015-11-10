require 'adroll/service'

module AdRoll
  module Api
    class Ad < AdRoll::Api::Service
      class << self
        def clone(destination_url: nil, name: nil, headline: nil, body: nil)
          params = {
            destination_url: destination_url,
            name: name,
            headline: headline,
            body: body
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def create(advertisable:, file:, dynamic_template_id:, destination_url: nil, name: nil,
                   headline: nil, body: nil, message: nil, product: nil, logo: nil, background: nil)
          params = {
            advertisable: advertisable,
            file: file,
            dynamic_template_id: dynamic_template_id,
            destination_url: destination_url,
            name: name,
            headline: headline,
            body: body,
            product: product,
            logo: logo,
            background: background
          }.reject { |_, value| value.nil? }

          call_api(:post, __method__, params)
        end

        def edit(ad:, destination_url: nil, name: nil, headline: nil, body: nil)
          params = {
            ad: ad,
            destination_url: destination_url,
            name: name,
            headline: headline,
            body: body
          }.reject { |_, value| value.nil? }

          call_api(:put, __method__, params)
        end

        def get(ad:)
          params = {
            ad: ad
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end

        def set_outline(ad:)
          params = {
            ad: ad
          }.reject { |_, value| value.nil? }

          call_api(:get, __method__, params)
        end
      end
    end
  end
end

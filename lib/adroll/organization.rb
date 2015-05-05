module AdRoll
  module Api
    class Organization < AdRoll::Api::Service
      API_METADATA =
        [
          { endpoint: :get,
            request_method: :get },

          { endpoint: :get_advertisables,
            request_method: :get,
            collection: :advertisable },

          { endpoint: :get_billing_methods,
            request_method: :get,
            collection: :billing_method },

          { endpoint: :get_users,
            request_method: :get,
            collection: :user },

          { endpoint: :reset,
            request_method: :get }
        ]

      SERVICE_ATTRIBUTES = [
        :api_request_limit,
        :billing_city,
        :billing_country,
        :billing_email,
        :billing_name,
        :billing_postal_code,
        :billing_state,
        :billing_street,
        :billing_street_2,
        :created_date,
        :eid,
        :is_prepaid,
        :is_sandbox,
        :is_trusted,
        :name,
        :referral_payment_eligible,
        :tax_id,
        :vat_number
      ]
    end
  end
end

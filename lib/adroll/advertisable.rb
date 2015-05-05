module AdRoll
  module Api
    class Advertisable < AdRoll::Api::Service
      API_METADATA =
        [
          { endpoint: :create,
            request_method: :post },

          { endpoint: :edit,
            request_method: :put },

          { endpoint: :enable_rollcrawl,
            request_method: :get },

          { endpoint: :get,
            request_method: :get },

          { endpoint: :get_adgroups,
            request_method: :get,
            collection: :ad_group },

          { endpoint: :get_ads,
            request_method: :get,
            collection: :ad },

          { endpoint: :get_campaigns,
            request_method: :get,
            collection: :campaign },

          { endpoint: :get_coops,
            request_method: :get,
            collection: :coop },

          { endpoint: :get_pixel,
            request_method: :get },

          { endpoint: :get_segments,
            request_method: :get,
            collection: :segment }
        ]

      SERVICE_ATTRIBUTES = [
        :account,
        :account_is_prepaid,
        :am_email,
        :attached_users,
        :blacklisted_sites,
        :click_through_conversion_window,
        :cm_networks,
        :created_date,
        :currency,
        :eid,
        :enable_customer_multi_dur_segs,
        :fb_offsite_pixels_tos_accepted,
        :fbx_account_id,
        :fbx_page_id,
        :fbx_page_url,
        :is_active,
        :is_coop_approved,
        :is_marketo_syncing,
        :is_managed,
        :is_twitter_syncing,
        :is_mailchimp_syncing,
        :mailchimp_api_key,
        :marketo_api_endpoint,
        :marketo_client_id,
        :marketo_secret_key,
        :name,
        :organization,
        :path_name,
        :product_name,
        :revshare_click_percent,
        :revshare_view_percent,
        :rollcrawl_enabled,
        :status,
        :twitter_handle,
        :updated_date,
        :url,
        :view_through_conversion_window
      ]
    end
  end
end

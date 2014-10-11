require 'factory_girl'

FactoryGirl.define do
  factory :service, class: AdRoll::Api::Service do
    initialize_with { new(attributes) }
  end
end

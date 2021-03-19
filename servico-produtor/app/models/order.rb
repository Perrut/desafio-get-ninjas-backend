class Order < ApplicationRecord
    after_create { publish_to_dashboard }

    has_one :user_info, dependent: :destroy
    has_one :address_attribute, dependent: :destroy
    has_one :request_info, dependent: :destroy

    private

    def publish_to_dashboard
        Publisher.publish('restaurants', attributes)
    end
end

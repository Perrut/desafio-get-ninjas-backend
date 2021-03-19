class Order < ApplicationRecord
    has_one :user_info, dependent: :destroy
    has_one :address_attribute, dependent: :destroy
    has_one :request_info, dependent: :destroy
end

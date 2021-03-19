class Order < ApplicationRecord
    has_one :user_info, dependent: :destroy
    has_one :address_attribute, dependent: :destroy
    has_one :request_info, dependent: :destroy

    def publish_to_dashboard
        publish_data = {
            "id": id,
            "user_info": {
                "phone": user_info.phone,
                "name": user_info.name,
                "email": user_info.email
            },
            "address_attributes": {
                "city": address_attribute.city,
                "neighborhood": address_attribute.neighborhood,
                "street": address_attribute.street,
                "uf": address_attribute.uf,
                "zip_code": address_attribute.zip_code
            },
            "request_info": {
                "question1": request_info.question1,
                "question2": request_info.question2,
                "question3": request_info.question3
            }
        }
        
        Publisher.publish('orders', publish_data)
    end

    def start_queue
        Publisher.create_fanout('orders')
    end
end

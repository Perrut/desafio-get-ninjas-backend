# frozen_string_literal: true

class Message < ApplicationRecord
    after_create { publish_to_dashboard }
    
    private  
    
    def publish_to_dashboard
        Publisher.publish('restaurants', attributes)
    end
end

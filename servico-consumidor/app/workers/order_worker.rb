require 'sneakers'
require 'httparty'
require 'json'

class OrderWorker
    include Sneakers::Worker

    Sneakers.configure  :heartbeat => 30,
                    :amqp => 'amqp://user:password@my-rabbit:5672',
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

    from_queue "consumer.orders"
    
    def work(raw_order)
      order = JSON.parse(raw_order)
      order["address_attributes"]["lat"] = "lat"
      order["address_attributes"]["lng"] = "lng"

      params = {
        body: JSON.generate(order),
        headers: { 
           "Accept" => "application/json",
           "Content-Type" => "application/json"
        }
      }

      params[:debug_output] = STDOUT

      HTTParty.put("http://producer:3000/orders/#{order["id"]}", params)
      ack! 
    end
end

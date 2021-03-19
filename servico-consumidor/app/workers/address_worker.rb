require 'sneakers'
require 'httparty'
require 'json'

class AddressWorker
    include Sneakers::Worker

    Sneakers.configure  :heartbeat => 30,
                    :amqp => 'amqp://user:password@my-rabbit:5672',
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

    from_queue "dashboard.restaurants"
    
    def work(raw_restaurant)
      restaurant = JSON.parse(raw_restaurant)

      params = {
        body: JSON.generate(restaurant),
        headers: { 
           "Accept" => "application/json",
           "Content-Type" => "application/json"
        }
      }

      params[:debug_output] = STDOUT

      HTTParty.put("http://producer:3000/orders/#{restaurant["id"]}", params)

      print raw_restaurant
      ack! 
    end
end

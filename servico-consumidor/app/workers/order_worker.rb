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
        body: {},
        headers: { 
           "Accept" => "application/json",
           "Content-Type" => "application/json"
        }
      }

      params[:debug_output] = STDOUT

      formatted_address = ""
      formatted_address += order["address_attributes"]["street"] + " "
      formatted_address += order["address_attributes"]["neighborhood"] + " "
      formatted_address += order["address_attributes"]["city"] + " "
      formatted_address += order["address_attributes"]["uf"] + " "
      formatted_address += order["address_attributes"]["zip_code"]

      begin
        response_address = HTTParty.get("http://api.positionstack.com/v1/forward?" +
        "access_key=9c41309b6d87bd8505b2a1a6b4387488&query="+ CGI.escape("#{formatted_address}"))

        if response_address.code == 200
          begin
            address = JSON.parse(response_address.body)
            order["address_attributes"]["lat"] = address["data"][0]["latitude"]
            order["address_attributes"]["lng"] = address["data"][0]["longitude"]
          rescue
            order["address_attributes"]["lat"] = "n/a"
            order["address_attributes"]["lng"] = "n/a"
          end
        end
      rescue
      end

      params[:body] = JSON.generate(order)

      HTTParty.put("http://producer:3000/orders/#{order["id"]}", params)
      ack! 
    end
end

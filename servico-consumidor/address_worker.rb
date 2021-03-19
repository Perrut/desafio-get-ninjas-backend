require 'sneakers'

class AdressWorker
    include Sneakers::Worker

    Sneakers.configure  :heartbeat => 30,
                    :amqp => 'amqp://user:password@my-rabbit:5672',
                    :vhost => '/',
                    :exchange => 'sneakers',
                    :exchange_type => :direct

    from_queue "dashboard.restaurants"
    
    def work(raw_restaurant)
      print "mensagem recebida ========================="
      ack! 
    end
end

namespace :rabbitmq do
    desc "Connect consumer to producer"
    task :setup do
      require "bunny"
      require "httparty"

      params = {
        headers: { 
           "Accept" => "application/json",
           "Content-Type" => "application/json"
        }
      }

      params[:debug_output] = STDOUT

      HTTParty.post("http://producer:3000/orders/start_queue", params)

      conn = Bunny.new(:host => "my-rabbit", :user => "user", :password => "password").tap(&:start)    
      ch = conn.create_channel    
      queue_restaurants = ch.queue("consumer.orders", :durable => true, :auto_delete => false)
       # bind queue to exchange
      queue_restaurants.bind("producer.orders")
      conn.close
    end
end

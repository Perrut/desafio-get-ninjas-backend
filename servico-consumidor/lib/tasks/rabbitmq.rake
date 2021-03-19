namespace :rabbitmq do
    desc "Connect consumer to producer"
    task :setup do
      require "bunny"    
      conn = Bunny.new(:host => "my-rabbit", :user => "user", :password => "password").tap(&:start)    
      ch = conn.create_channel    
      queue_restaurants = ch.queue("dashboard.restaurants", :durable => true, :auto_delete => false)
       # bind queue to exchange
      queue_restaurants.bind("crawler.restaurants")    
      conn.close
    end
end

require 'bunny'

class Publisher
  class << self
    def publish(exchange, message = {})
      x = channel.fanout("crawler.#{exchange}")
      x.publish(message.to_json)
    end

    def channel
      @channel ||= connection.create_channel
    end
        
    def connection
      @connection ||= Bunny.new(:host => "my-rabbit", :user => "user", :password => "password").tap(&:start)
    end
  end
end

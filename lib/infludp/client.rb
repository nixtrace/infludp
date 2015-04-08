module Infludp
  class Client
    attr_accessor :socket, :address, :port

    def initialize(args)
      @socket = UDPSocket.new
      @address = args[:address]
      @port = args[:port]
    end

    def send(name, data)
      socket.send(
        build_metric(name, data),
        0,
        address,
        port
      )
    end

    def build_metric(name, data)
      [{
        name: name,
        columns: data.keys.map{|key| key.to_s},
        points: data.values
      }].to_json
    end
  end
end

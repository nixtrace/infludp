module Infludp
  class Client
    attr_accessor :host, :port

    def initialize(args)
      @host = args[:host]
      @port = args[:port]
    end

    def socket
      Thread.current[:infludp_socket] ||= UDPSocket.new
    end

    def send(name, data)
      socket.send(
        build_metric(name, data),
        0,
        host,
        port
      )
    end

    def build_metric(name, data)
      [{
        name: name,
        columns: data.keys.map{|key| key.to_s},
        points: [data.values]
      }].to_json
    end
  end
end

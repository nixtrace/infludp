module Infludp
  class Client
    attr_reader :socket

    def initialize(args)
      @socket = UDPSocket.new.connect(
        args[:address],
        args[:port]
      )
    end

    def send(name, data)
      socket.send(build_metric(name, data), 0)
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

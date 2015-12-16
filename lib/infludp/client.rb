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
      values = data.map do |key, value|
        if value.is_a?(String)
          "#{key}=\"#{value}\""
        else
          "#{key}=#{value}"
        end
      end

      "#{name} #{values.join(',')}"
    end
  end
end

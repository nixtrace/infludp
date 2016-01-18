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

    def send(name, tags, fields)
      socket.send(
        build_metric(name, tags, fields),
        0,
        host,
        port
      )
    end

    def build_metric(name, tags, fields)
      "#{name},#{to_line(tags)} #{to_line(fields)}"
    end

    def to_line(hash)
      hash.map do |key, value|
        if value.is_a?(String)
          "#{key}=\"#{value}\""
        else
          "#{key}=#{value}"
        end
      end.join(',')
    end
  end
end

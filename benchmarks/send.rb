require_relative '../lib/infludp'
require 'benchmark'

Benchmark.bmbm(27) do |bm|
  bm.report('1000 metrics:') do
    client = Infludp::Client.new(
      address: '127.0.0.1',
      port: 3333
    )

    1000.times do
      name = 'cpu.load'
      data = {
        node: 'east.server1',
        value: 22
      }

      client.send(name, data)
    end
  end
end

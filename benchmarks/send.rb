require_relative '../lib/infludp'
require 'benchmark'

Benchmark.bmbm(27) do |bm|
  bm.report('1000 metrics:') do
    client = Infludp::Client.new(
      address: '127.0.0.1',
      port: 4444
    )

    1000.times do
      name = 'cpu'
      tags = {
        node: 'server1',
        os: 'ubuntu'
      }
      fields = {
        value: 22
      }

      client.send(name, tags, fields)
    end
  end
end

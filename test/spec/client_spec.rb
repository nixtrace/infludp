require_relative '_init'

describe 'InfluxDB UDP client' do
  before do
    @client = Infludp::Client.new(
      address: '127.0.0.1',
      port: 3333
    )
  end

  it 'represents a client' do
    @client.must_be_instance_of Infludp::Client
  end

  it 'can build a metric' do
    expected = [{
      name: 'cpu.load',
      columns: ['node', 'value'],
      points: ['east.server1', 22]
    }]

    generated_metric = @client.build_metric('cpu.load', {
      node: 'east.server1',
      value: 22
    })

    generated_metric.must_equal expected.to_json
  end

  it 'can send a metric via UDP' do
    name = 'cpu.load'
    data = {
      node: 'east.server1',
      value: 22
    }

    expected = [{
      name: 'cpu.load',
      columns: ['node', 'value'],
      points: ['east.server1', 22]
    }]

    reader, writer = IO.pipe

    server = fork {
      socket = UDPSocket.new
      socket.bind('0.0.0.0', 3333)
      data, addr = socket.recvfrom(1024)
      writer.write data
    }
    Process.detach server
    sleep 1

    @client.send(name, data)
    sleep 1

    writer.close
    reader.read.must_equal expected.to_json
    reader.close
  end
end

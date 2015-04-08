require_relative '_init'

describe 'InfluxDB UDP client' do
  before do
    @client = Infludp::Client.new(
      address: '127.0.0.1',
      port: 4444
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

    generated_metric = @client.build_metric('cpu.load',{
      node: 'east.server1',
      value: 22
    })

    generated_metric.must_equal expected.to_json
  end
end

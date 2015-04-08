# Infludp.

A minimal, 0 deps gem to just send UDP metrics to [InfluxDB](http://influxdb.com/), and nothing else.

# Why.

Most of the time the apps we develop doesn't need to interact with the InfluxDB HTTP API or do any operation, but just send metrics via UDP.

There are many great client libraries for InfluxDB, and you should definitely check them out if you need to interact with the InfluxDB HTTP API.

## Installation.

- Add infludp to your Gemfile:
```ruby
gem 'infludp'
```

## Usage.

```ruby
$metrics = Infludp::Client.new(
  address: '127.0.0.1',
  port: 4444
)
$metrics.send('cpu.load', {
  node: 'east.server1',
  value: 22
})
```

## Test.

- Be sure you have a local InfluxDB server running.

- run tests with:
```ruby
bundle exec rake test:spec
```

## Contributing.

1. Fork it ( https://github.com/badshark/infludp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License.

[MIT](LICENSE.txt)

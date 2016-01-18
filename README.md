# Infludp.

A minimal, zero dependencies, thread-safe Ruby gem to send metrics via UDP to [InfluxDB](http://influxdb.com/), and nothing else.

## Installation.

- Add infludp to your Gemfile:
```ruby
gem 'infludp'
```

## Usage.

```ruby
$metrics = Infludp::Client.new(
  host: '127.0.0.1',
  port: 4444
)

$metrics.send('cpu',
{
  node: 'server1',
  os: 'ubuntu'
},
{
  value: 22
})
```

## Test.

```ruby
bundle exec rake test:all
```
## Benchmarks.

```
Rehearsal ---------------------------------------------------------------
1000 metrics:                 0.020000   0.000000   0.020000 (  0.018585)
------------------------------------------------------ total: 0.020000sec

                                  user     system      total        real
1000 metrics:                 0.020000   0.000000   0.020000 (  0.019719)
```

## Contributing.

1. Fork it ( https://github.com/badshark/infludp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License.

[MIT](LICENSE.txt)

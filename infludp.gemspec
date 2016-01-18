# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infludp/version'

Gem::Specification.new do |spec|
  spec.name          = "infludp"
  spec.version       = Infludp::VERSION
  spec.authors       = ["Marco Lisci"]
  spec.email         = ["info@badshark.io"]

  spec.summary       = %q{A minimal, zero dependencies, thread-safe Ruby gem to send metrics via UDP to InfluxDB.}
  spec.description   = %q{A minimal, zero dependencies, thread-safe Ruby gem to send metrics via UDP to InfluxDB.}
  spec.homepage      = "https://github.com/badshark/infludp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|benchmarks)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
end

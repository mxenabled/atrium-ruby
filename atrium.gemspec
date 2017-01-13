# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'atrium/version'

Gem::Specification.new do |spec|
  spec.name          = "atrium"
  spec.version       = ::Atrium::VERSION
  spec.authors       = ["Jon Carstens, Dan Jones, Zach Toolson"]
  spec.email         = ["jon.carstens@mx.com, dan.jones@mx.com, zach.toolson@mx.com"]

  spec.summary       = "Ruby wrapper for the Atrium API by MX"
  spec.description   = "Ruby wrapper for the Atrium API by MX"
  spec.homepage      = "http://github.com/mxenabled/atrium-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "active_attr"
  spec.add_runtime_dependency "httpclient"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

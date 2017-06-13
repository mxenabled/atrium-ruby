# Atrium-Ruby [![Build Status](https://travis-ci.org/mxenabled/atrium-ruby.svg?branch=master)](https://travis-ci.org/mxenabled/atrium-ruby)

A Ruby wrapper for use with the [MX Atrium API](https://atrium.mx.com). In order to make requests, you will need to [sign up for MX Atrium API](https://atrium.mx.com/developers/sign_up) and get a `MX-API-KEY` and `MX-CLIENT-ID`. Then, configure your instance with:
```ruby
Atrium.configure do |config|
  config.mx_api_key = YOUR_API_KEY
  config.mx_client_id = YOUR_CLIENT_ID
end
```

From there, you can start using some basic class methods to make calls for data. See our [full documentation](https://atrium.mx.com/documentation) for more details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'atrium-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install atrium-ruby

## Development

Suggested implementation flow can be found in `bin/demo` comments. You can also use that as an executable for managing the settings and creating your own test flow to handle the requests and data with `./bin/demo`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mxenabled/atrium-ruby.

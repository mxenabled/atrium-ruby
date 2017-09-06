# Atrium-Ruby [![Build Status](https://travis-ci.org/mxenabled/atrium-ruby.svg?branch=master)](https://travis-ci.org/mxenabled/atrium-ruby)

A Ruby wrapper for use with the [MX Atrium API](https://atrium.mx.com). In order to make requests, you will need to [sign up for MX Atrium API](https://atrium.mx.com/developers/sign_up) and get a `MX-API-KEY` and `MX-CLIENT-ID`. Then, configure your instance with:
```ruby
Atrium.configure do |config|
  config.mx_api_key = YOUR_API_KEY
  config.mx_client_id = YOUR_CLIENT_ID
  config.base_url = "https://atrium.mx.com" # base_url is set to "https://vestibule.mx.com" by default
end
```

From there, you can start using some basic class methods to make calls for data. See our [full documentation](https://atrium.mx.com/documentation) for more details.

## Examples

### Pagination

The following demonstrates how you can read data back from the API in a memory efficient way using built-in pagination
helpers. You can also specify query parameters such as `from_date` and `to_date`.

```ruby
::Atrium::User.list_each do |user|
  user.each_member do |member|
    puts member.name
    puts member.accounts.total_entries

    member.each_account do |account|
      puts account.name
      puts account.transactions.total_entries

      account.each_transaction do |transaction|
        puts transaction.description
      end
    end
  end

  user.each_account do |account|
    puts account.name
    puts account.transactions.total_entries

    account.each_transaction do |transaction|
      puts transaction.description
    end
  end

  user.each_transaction do |transaction|
    puts transaction.description
  end
end
```

### Date Range

You can specify `from_date` and `to_date` to limit or widen your search. For example:

```ruby
from_date = ::Date.new(2017, 02, 18)
to_date = ::Date.new(2017, 03, 18)
params = {:from_date => from_date, :to_date => to_date}

::Atrium::Transaction.list_each(:user_guid => "USR-123", :query_params => params) do |transaction|
  puts transaction.description
end
```

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

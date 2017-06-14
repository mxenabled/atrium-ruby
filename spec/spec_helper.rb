require 'rubygems'
require 'bundler'
require 'active_attr/rspec'
require 'atrium'

::Bundler.require(:default, :development, :test)

::RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

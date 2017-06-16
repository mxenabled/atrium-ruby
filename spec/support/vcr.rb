# frozen_string_literal: true
require 'vcr'

ENV['ATRIUM_API_KEY']   = ENV.fetch('ATRIUM_API_KEY',   'ATRIUM_API_KEY')
ENV['ATRIUM_CLIENT_ID'] = ENV.fetch('ATRIUM_CLIENT_ID', 'ATRIUM_CLIENT_ID')

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock

  config.configure_rspec_metadata!

  config.filter_sensitive_data('ATRIUM_API_KEY')   { ENV['ATRIUM_API_KEY'] }
  config.filter_sensitive_data('ATRIUM_CLIENT_ID') { ENV['ATRIUM_CLIENT_ID'] }
end

RSpec.configure do |config|
  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}

    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example
             .metadata[:full_description]
             .split(/\s+/, 2)
             .join('/')
             .underscore
             .strip
             .gsub(/[\.#]/, '/')
             .gsub(%r([^\w/]+), '_')
             .gsub(%(/$), '')
             .gsub('_/', '/')

      VCR.use_cassette(name, options, &example)
    end
  end
end

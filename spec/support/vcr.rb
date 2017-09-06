# frozen_string_literal: true

require "vcr"

ENV["ATRIUM_API_KEY"]   = ENV.fetch("ATRIUM_API_KEY",   "ATRIUM_API_KEY")
ENV["ATRIUM_CLIENT_ID"] = ENV.fetch("ATRIUM_CLIENT_ID", "ATRIUM_CLIENT_ID")

VCR_CASSETTES_BASE_PATH = "spec/cassettes"

VCR.configure do |config|
  config.cassette_library_dir = VCR_CASSETTES_BASE_PATH
  config.hook_into :webmock

  config.configure_rspec_metadata!

  config.filter_sensitive_data("ATRIUM_API_KEY")   { ENV["ATRIUM_API_KEY"] }
  config.filter_sensitive_data("ATRIUM_CLIENT_ID") { ENV["ATRIUM_CLIENT_ID"] }
end

RSpec.shared_context "vcr", :shared_context => :metadata do
  let(:vcr_cassette_name) { nil }

  around(:each) do |example|
    options = example.metadata[:vcr] || {}
    options[:allow_playback_repeats] = true

    case
    when options[:record] == :skip
      VCR.turned_off(&example)
    when vcr_cassette_name.nil?
      VCR.turned_off(&example)
    else
      cassette_path = File.join(VCR_CASSETTES_BASE_PATH, "#{vcr_cassette_name}.yml")
      raise ArgumentError, "no valid cassette tape found: #{cassette_path}" unless File.exist?(cassette_path)
      VCR.use_cassette(vcr_cassette_name, options, &example)
    end
  end
end

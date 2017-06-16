module Atrium
  class Client
    DEVELOPMENT_URL = 'https://vestibule.mx.com'.freeze
    attr_accessor :mx_api_key, :mx_client_id, :base_url

    def initialize(api_key = nil, client_id = nil, base_url = DEVELOPMENT_URL)
      @mx_api_key   = api_key
      @mx_client_id = client_id
      @base_url     = base_url
    end

    def make_request(method, endpoint, body = nil, headers = {})
      headers = default_headers.merge(headers)
      url     = "#{base_url}#{endpoint}"
      body    = ::JSON.dump(body) if body

      response = http_client.public_send(method, url, body, headers)

      handle_response(response)
    end

    def http_client
      @http_client ||= ::HTTPClient.new
    end

    private

    def default_headers
      {
        'Accept'       => 'application/vnd.mx.atrium.v1+json',
        'Content-Type' => 'application/json',
        'MX-API-KEY'   => mx_api_key,
        'MX-CLIENT-ID' => mx_client_id
      }
    end

    def handle_response(response)
      # Handle 200-206 responses as acceptable
      unless response.status.between?(200, 206)
        raise ::Atrium::Error, "#{response.status}: #{response.body}"
      end

      ::JSON.parse(response.body) unless response.body.empty?
    end
  end
end

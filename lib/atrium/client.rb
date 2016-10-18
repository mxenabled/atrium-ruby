module Atrium
  class Client
    attr_accessor :mx_api_key, :mx_client_id

    def initialize(api_key = nil, client_id = nil)
      @mx_api_key = api_key
      @mx_client_id = client_id
    end

    def make_request(method, endpoint, body = {}, headers = {})
      headers = default_headers.merge(headers)
      url = "#{::Atrium::BASE_URL}#{endpoint}"
      binding.pry
      response = http_client.request(method, url, ::JSON.dump(body), headers)

      handle_response(response)
    end

    def http_client
      @http_client ||= ::HTTPClient.new
    end

  private

    def default_headers
      {
        "Accept" => "application/vnd.mx.atrium.v1+json",
        "MX-API-KEY" => mx_api_key,
        "MX-CLIENT-ID" => mx_client_id
      }
    end

    def handle_response(response)
      # Handle 200 OK or 204 No Content as acceptable
      if response.status != 200 || response.status != 204
        fail ::Atrium::Error, "#{response.status}: #{response.body}"
      end

      ::JSON.parse(response.body)
    end
  end
end

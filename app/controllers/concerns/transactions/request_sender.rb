module Transactions
  class RequestSender
    include Connection
    attr_reader :body, :response

    def initialize(args)
      @body = args[:body] || {}
    end

    def make_request
      opts = { url: 'http://localhost: 3222', request: :url_encoded }
      @response = connection(opts).post(&request)
    end

    private

    def request
      lambda do |request|
        request.url '/transactions'
        block request, &request_headers
        block request, &request_body
      end
    end

    def request_headers
      lambda do |request|
        request.headers['Content-Type'] = 'application/json'
      end
    end

    def request_body
      lambda do |request|
        request.body = body.to_json
      end
    end

    def block(param)
      yield param
    end
  end
end

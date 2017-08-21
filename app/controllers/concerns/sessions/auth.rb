module Sessions
  class Auth
    attr_reader :email, :password, :response

    def initialize(args)
      @email = args[:email]
      @password = args[:password]
    end

    def sign_in
      response = connection.post &request
      @response = JSON.parse(response.body).convert_response
    end

    def access_token
      response[:access_token]
    end

    def refresh_token
      response[:refresh_token]
    end

    def user_id
      response[:user_id]
    end

    private

    def connection
      Faraday.new(url: 'http://localhost:3000') do |faraday|
        faraday.request :url_encoded
        faraday.adapter :net_http
      end
    end

    def request
      lambda do |request|
        request.url '/token'
        request.params['grant_type'] = 'password'
        request.params['email'] = email
        request.params['password'] = password
      end
    end

    def convert_response
      response.reduce({}) { |hash, (key, value)| hash[key.to_sym] = value; hash }
    end
  end
end
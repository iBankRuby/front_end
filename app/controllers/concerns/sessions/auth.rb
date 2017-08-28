module Sessions
  class Auth
    include Connection
    attr_reader :email, :password, :response

    def initialize(args)
      @email = args[:email]
      @password = args[:password]

      sign_in
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

    def sign_in
      opts = { url: 'localhost:3111', request: :url_encoded }
      response = connection(opts).post(&request)
      @response = JSON.parse(response.body).convert
    end

    def request
      lambda do |request|
        request.url '/token'
        request.params['grant_type'] = 'password'
        request.params['email'] = email
        request.params['password'] = password
      end
    end

    def convert
      each_with_object({}) { |(key, value), memo| memo[key.to_sym] = value }
    end
  end
end

module Registrations
  class SignUp
    include Connection
    attr_reader :email, :password, :password_confirmation, :response

    def initialize(args)
      @email = args[:email]
      @password = args[:password]
      @password_confirmation = args[:password_confirmation]

      sign_up
    end

    def status
      response.status
    end

    private

    def sign_up
      opts = { url: 'http:localhost:3111', request: :url_encoded }
      response = connection(opts).post(&request)
      @response = JSON.parse(response)
    end

    def response_body
      @response_body ||= response.body.convert
    end

    def request
      lambda do |request|
        request.url = '/sign_up'
        request.params['email'] = email
        request.params['password'] = password
        request.params['password_confirmation'] = password_confirmation
      end
    end

    def convert
      each_with_object({}) { |(key, value), memo| memo[key.to_sym] = value }
    end
  end
end

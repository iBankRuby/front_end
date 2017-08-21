module Decoder
  module JWT
    attr_reader :payload, :header

    def decode(token)
      @payload, @header = JWT.decode token, verify_key, true, { alghoritm: 'RS512' }
    end

    private

    def verify_key
      verify_key_path = File.expand_path('app.rsa.pub', Rails.root)
      File.open(verify_key_path) do |file|
        @verify_key ||= OpenSSL::PKey.read(file)
      end
    end
  end
end

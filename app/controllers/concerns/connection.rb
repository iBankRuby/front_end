module Connection
  def connection(args = {})
    request = args[:request]
    @connection ||= Faraday.new(url: (args[:url] || 'http://localhost:3000')) do |faraday|
      faraday.request request if request
      faraday.adapter args[:adapter] || :net_http
    end
  end
end

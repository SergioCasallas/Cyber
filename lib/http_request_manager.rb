require 'uri'
require 'net/http'

class HttpRequestManager

  TOKEN = "b7e2db3a-08b2-41ce-bdf7-fdb4594757db"

  attr_accessor :url, :token

  def initialize(url, token = TOKEN)
    @url   = URI(url)
    @token = token
  end

  def build_response(http_method)
    https = Net::HTTP.new(url.host, url.port)

    request = http_method.new(url)
    request["content-type"] = "application/json"
    request["Token"] = token
    https.request(request)
  end

end

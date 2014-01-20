require 'net/http'
require 'uri'

class Fetcher
  def initialize(opts={})
    @opts = opts
  end

  def fetch(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port, @opts[:proxy])

    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    p response
    response.body.encode('iso-8859-1').force_encoding('utf-8')
  end


end
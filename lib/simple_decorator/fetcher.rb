require 'net/http'
require 'uri'

class Fetcher
  def initialize(opts={})
    @opts = opts
  end

  def fetch(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port, @opts[:proxy])
    http.request(Net::HTTP::Get.new(uri.request_uri)).body.encode('UTF-8', 'ISO-8859-1')
  end


end
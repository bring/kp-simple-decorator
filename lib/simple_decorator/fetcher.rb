require 'net/http'
require 'uri'

class Fetcher
  def initialize(opts={})
    @opts = opts
  end

  def fetch(opts)
    if opts.is_a?(String)
      url = opts
      headers = {}
    else
      url     = opts.fetch(:url)
      headers = opts.fetch(:headers)
    end

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port, @opts[:proxy])
    http.use_ssl = true if uri.class == URI::HTTPS

    req = Net::HTTP::Get.new(uri.request_uri)
    headers.each { |name, val| req[name] = val }

    http.request(req).body.force_encoding('utf-8').encode('utf-8')
  end


end
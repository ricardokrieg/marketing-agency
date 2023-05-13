require 'faraday'

class ProxyChecker
  def initialize(ipify_token:)
    @ipify_token = ipify_token
  end

  def check(proxy)
    ip_location(ip_address(proxy))
  end

  def ip_address(proxy)
    proxy_conn(proxy).get('/ip').body
  end

  def ip_location(ip)
    conn.get('/api/v2/country', apiKey: @ipify_token, ipAddress: ip).body
  end

  private

  def proxy_conn(proxy)
    @proxy_conn ||= {}
    @proxy_conn[proxy] ||= Faraday.new({ url: 'https://api.my-ip.io', proxy: proxy, ssl: { verify: false } })
  end

  def conn
    @conn ||= Faraday.new({ url: 'https://geo.ipify.org', ssl: { verify: false } })
  end
end

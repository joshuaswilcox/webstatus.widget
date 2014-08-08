require 'net/http'
require 'json'
urls = [
  'http://ahealthybalanceinc.com/',
  'http://southshoremoves.com',
  "http://healthe.ahealthybalanceinc.com",
  "http://kaf.ahealthybalanceinc.com",
  "http://sealcoating.ahealthybalanceinc.com",
  "http://thescotchcabi.net"
]
hash = {}
urls.each_with_index do |url, i|
  uri = URI(url)
  hash[i] = {url: url, code: Net::HTTP.get_response(uri).code}
end

puts JSON.generate(hash)
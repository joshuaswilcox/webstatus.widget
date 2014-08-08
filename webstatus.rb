require 'net/http'
require 'json'
urls = [
  ['ahealthybalanceinc.com/', 'AHB'],
  ['southshoremoves.com', 'SSM'],
  ["healthe.ahealthybalanceinc.com", "H-AHB"],
  ["kaf.ahealthybalanceinc.com", "K-AHB"],
  ["sealcoating.ahealthybalanceinc.com", "S-AHB"],
  ["thescotchcabi.net", "SCN"]
]
hash = {}
urls.each_with_index do |url, i|
  uri = URI("http://#{url[0]}")
  hash[i] = {url: url[0], code: Net::HTTP.get_response(uri).code, short_name: url[1]}
end

puts JSON.generate(hash)

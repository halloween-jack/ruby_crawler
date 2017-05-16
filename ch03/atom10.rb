require 'nokogiri'
require 'open-uri'

url = 'http://b.hatena.ne.jp/dkfj/atomfeed'

# User Agentを指定しないと弾かれるので適当に設定
xml = open(url, 'User-Agent' => 'xxx').read

doc = Nokogiri::XML(xml)

namespaces = {
  atom: 'http://purl.org/atom/ns#',
  dc: 'http://purl.org/dc/elements/1.1/',
}

entries = doc.xpath('//atom:entry', namespaces)
entries.each do |entry|
  puts entry.xpath('atom:title', namespaces).text
end

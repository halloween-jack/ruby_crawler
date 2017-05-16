require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://www.yahoo.co.jp'))

nodesets = doc.xpath('//a')
puts nodesets.inner_text

nodesets.each{|node|
  puts node.inner_text
}

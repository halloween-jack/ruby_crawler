require 'nokogiri'
require 'open-uri'

html = open(
  "https://www.amazon.co.jp/gp/bestsellers/", "r:Shift_JIS")
doc = Nokogiri.HTML(html, nil, "Shift_JIS")

puts doc.xpath('//title').text

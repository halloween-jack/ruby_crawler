require 'nokogiri'
require 'open-uri'

# 2017/05/17のamazonの文字コードはutf-8のためエラー
html = open(
  "https://www.amazon.co.jp/gp/bestsellers/").read.encode("UTF-8", "Shift_JIS")
doc = Nokogiri.HTML(html)
puts doc.xpath('//title').text

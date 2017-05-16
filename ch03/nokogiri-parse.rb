require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://www.yahoo.co.jp'))
p doc

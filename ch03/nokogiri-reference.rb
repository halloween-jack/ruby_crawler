require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://www.yahoo.co.jp'))

## Node reference
# html
puts doc.at('//title').to_html
puts doc.at('//title').to_xhtml
puts doc.at('//title').to_xml
puts doc.at('//title').to_str

# string enclosed by html tag
puts doc.at('//title').text
puts doc.at('//title').inner_html
puts doc.at('//title').inner_text
puts doc.at('//title').to_str

# get attribute
puts doc.at('//a').[]('href')
puts doc.at('//a').attribute('href')
puts doc.at('//a').get_attribute('href')

## NodeSet reference
# html
puts doc.xpath('//title').to_html
puts doc.xpath('//title').to_xhtml
puts doc.xpath('//title').to_xml
puts doc.xpath('//title').to_str

# strign enclosed by html tag
puts doc.xpath('//title').text
puts doc.xpath('//title').inner_html
puts doc.xpath('//title').inner_text

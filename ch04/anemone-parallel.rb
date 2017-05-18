require 'parallel'
require 'nokogiri'
require 'open-uri'

urls = []
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466284/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466285/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466286/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466287/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466288/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466289/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466290/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466291/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466292/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466293/")

Parallel.each(urls, in_threads: 10) {|url|
  doc = Nokogiri::HTML(open(url))
  puts doc.title
}

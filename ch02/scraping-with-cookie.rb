require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []
urls.push("https://mixi.jp/")

cookies = {
  _auid: "xxxx",
  emid: "yyyyy",
  session: "8888_zzz",
  stamp: "qqqqq",
  vntgsync: "1"
}
opts = {
  delay: 1,
  accept_cookies: true,
  cookies: cookies,
  depth_limit: 0
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    communityList = doc.xpath("//*[@id=\"bodyMain\"]/div[4]/ul[1]/li")
    communityList += doc.xpath("//*[@id=\"bodyMain\"]/div[4]/ul[2]/li")
    communityList.each {|community|
      puts community.xpath("span[@class=\"name\"]/a").text
    }
  end
end

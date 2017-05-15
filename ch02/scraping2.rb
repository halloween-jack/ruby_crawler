require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []
urls.push("https://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466282/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466298/")



Anemone.crawl(urls, depth_limit: 0) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

    sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text

    puts category+"/"+sub_category

    items = doc.xpath("//div[@class=\"zg_itemRow\"]/div[1]/div/div/div[2]")
    p items
    items += doc.xpath("//div[@class=\"zg_itemRow\"]/div[2]/div/div/div[2]")
    items.each do |item|
      # ranking
      puts item.xpath("div[1]/span[@class=\"zg_rankNumber\"]").text

      # title
      puts item.xpath("a/div").text

      # ASIN
      puts item.xpath("a").attribute("href").text.match(%r{dp/(.+?)/})[1]
    end
  end
end

require 'anemone'

Anemone.crawl("http://www.amazon.co.jp/gp/bastsellers/", depth_limit: 1) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if { |link|
      link.to_s.match(/\/bastsellers/)
    }
  end
  anemone.on_every_page do |page|
    puts page.url
  end
end

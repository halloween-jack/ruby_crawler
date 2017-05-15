require 'selenium-webdriver'

# Launch browser
driver = Selenium::WebDriver.for :firefox

# Specify wait
driver.manage.timeouts.page_load = 10

driver.navigate.to 'https://twitter.com/search-home'

elements = driver.find_elements(
  :xpath, "//ul[@class='trend-items js-trends']/li/a")
elements.each do |element|
  # Display tweet
  puts element.text
end

driver.quit

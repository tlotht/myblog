require 'httparty'
require 'nokogiri'
require 'csv'
require "selenium-webdriver"
 #静态网页
 #  CSV.open('books.csv', 'w+',
 #           write_headers: true,
 #           headers: %w[Title Price Availability]) do |csv|
   
 #    50.times do |i|
 #      url = "https://books.toscrape.com/catalogue/page-#{i + 1}.html"
 #      response = HTTParty.get(url)
 #      document = Nokogiri::HTML(response.body)
 #      all_book_containers = document.css('article.product_pod')

 #      all_book_containers.each do |container|
 #         title = container.css('h3 a').first['title']
 #         price = container.css('.price_color').text.delete('^0-9.')
 #         availability = container.css('.availability').text.strip
 #         book = [title, price, availability]
 #        csv << book
 #       end
 #   end
 # end

 #动态网页
    # options = Selenium::WebDriver::Options.chrome(args: ['--headless=new'])
    # driver = Selenium::WebDriver.for :chrome, options: options
    #火狐
    #driver = Selenium::WebDriver.for :firefox

    driver = Selenium::WebDriver.for :chrome
    driver.get('https://quotes.toscrape.com/js/')

    quotes = []
    while true do
     quote_elements = driver.find_elements(css: '.quote')
     quote_elements.each do |quote_el|
       quote_text = quote_el.find_element(css: '.text').attribute('textContent')
       author = quote_el.find_element(css: '.author').attribute('textContent')
       quotes << [quote_text, author]
     end
     begin
       driver.find_element(css: '.next >a').click
     rescue
       break # Next button not found
     end
    end

    CSV.open('quotes.csv', 'w+', write_headers: true,
            headers: %w[Quote Author]) do |csv|
     quotes.each do |quote|
       csv << quote
     end
    end
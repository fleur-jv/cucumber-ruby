require 'rubygems'
require 'selenium-webdriver'

Given(/^I am on the Google search page$/) do
  visit "http://google.com/"
end

When(/^I search for ([^"]*)$/) do |query|
  page.find("input#lst-ib").send_keys("#{query}")
  # @driver.find_element(:name, "q").send_keys "#{query}"
  sleep(2)
  page.find(:xpath, "//span[@class='lsbb']//input[@value='Поиск в Google']").click
end

Then(/^the page title should start with ([^"]*)$/) do |query|
  # expect(find("title").to have_content("#{query} - Поиск в Google"))
  # wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait(find("title").to have_content("#{query} - Поиск в Google"))
  puts "Page title is #{page.title}"
  quit
end

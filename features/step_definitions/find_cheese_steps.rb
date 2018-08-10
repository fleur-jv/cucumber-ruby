require 'rubygems'
require 'selenium-webdriver'

Given(/^I am on the Google search page$/) do
  @driver = Selenium::WebDriver.for :chrome
  @driver.get "http://google.com/"
end

When(/^I search for ([^"]*)$/) do |query|
  @driver.find_element(:name, "q").send_keys "#{query}"
  sleep(2)
  @driver.find_element(:class_name, "lsb").click
end

Then(/^the page title should start with ([^"]*)$/) do |query|
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until {@driver.title == "#{query} - Поиск в Google"}
  puts "Page title is #{@driver.title}"
  @driver.quit
end

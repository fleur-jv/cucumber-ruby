require 'rubygems'
require 'selenium-webdriver'

Given(/^I am on the Google search page$/) do
  driver = Selenium::WebDriver.for :chrome
  driver.get "http://google.com/"
end

When(/^I search for "([A-Z])\w+"$/) do
  element = driver.find_element(:name, "q")
  element.send_keys "Cheese!"
  element.submit
end

Then(/^the page title should start with "([^"]*)"$/) do
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until {driver.title.downcase.start_with? "Cheese!"}
  puts "Page title is #{driver.title}"
  browser.close
end

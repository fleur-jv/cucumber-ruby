require 'rubygems'
require 'selenium-webdriver'

Given(/^I am on the Google search page$/) do
  visit "http://google.com/"
end

When(/^I search for ([^"]*)$/) do |query|
  page.find("input#lst-ib").send_keys("#{query}")
  page.find(:xpath, "//span[@class='lsbb']//input[@value='Поиск в Google']").click
end

Then(/^the page title should start with ([^"]*)$/) do |query|
  expect(page).to have_content("#{query} - Поиск в Google")
  puts "Page title is \"#{page.title}\""
  Capybara.current_session.driver.quit
end

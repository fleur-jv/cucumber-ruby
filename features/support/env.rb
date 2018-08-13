require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
# require 'selenium/webdriver'


Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
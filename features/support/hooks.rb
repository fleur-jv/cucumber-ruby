Before do
  Capybara.default_driver = :chrome
  Capybara.default_max_wait_time = 5
  Capybara.ignore_hidden_elements = false
end

After do |scenario|
  if scenario.failed?
    puts scenario.name
    puts scenario.exception.message
  end
end
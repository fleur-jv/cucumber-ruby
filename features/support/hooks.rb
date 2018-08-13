Before do
  Capybara.default_driver = :chrome
  Capybara.default_max_wait_time = 5
end

After do |scenario|
  if scenario.failed?
    puts scenario.name
    puts scenario.exception.message
  end
end
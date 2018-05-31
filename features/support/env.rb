require 'rubygems'
require 'selenium-webdriver'

Before do
  @driver = Selenium::WebDriver.for :firefox
  #@driver = Selenium::WebDriver.for :chrome
end

After do
  @driver.quit
end

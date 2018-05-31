Given /^I open "(.*?)"$/ do |site|
  @driver.get site
end

When /^I search for "(.*?)"$/ do |keyword|
  @keyword=keyword
  searchByKeyword(@keyword)
end

And /^I buy the book$/ do
  clickElementBy("class", "btn-buy")
end

Then /^I should see the book in returned results$/ do
  #gotoShoppingCart
  verifyItemShowInSearchResult(@keyword)
end

def searchByKeyword (keyword)
  searchKeyword=@driver.find_element :id => "key"
  @driver.manage.window.maximize
  searchKeyword.clear
  searchKeyword.send_keys keyword
  @driver.manage.timeouts.implicit_wait = 3
  #clickElementBy("class", "button")
  @driver.action.key_down(searchKeyword, :enter).perform
  #ask 'is this page ok?'
end

def clickElementBy (type, value)
  if type=="id"
    element=@driver.find_element :id => value
  elsif type=="xpath"
    element=@driver.find_element :xpath => value
  elsif type=="class"
    element=@driver.find_element :class => value
  else
    p "incorrect selector type"
  end
  element.click
end

def gotoShoppingCart
  clickElementBy("xpath", "//div[@id=\"settleup\"]//a")
end

def verifyItemShowInSearchResult (keyword)
  #config.expect_with(:rspec) { |c| c.syntax = :should }
  # wait = Selenium::WebDriver::Wait.new(timeout: 3)
  # wait.until { driver.find_element(id: "cheese").displayed? }
  @driver.manage.timeouts.implicit_wait = 3
  bookTitle=@driver.find_element :class => "p-name"
  bookTitle.text.should == keyword
end

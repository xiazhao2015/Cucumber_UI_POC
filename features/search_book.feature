Feature:
  In order to purchase it later
  As a consumer
  I want to search out a book by name from web browser

  @single
  Scenario: Consumer can search out a book from web browser
    Given I open "https://www.jd.com"
    When I search for "The Lean Startup"
    #And I buy the book
    Then I should see the book in returned results

  @multiple
  Scenario Outline: Consumer can search out multiple books from web browser
    Given I open "https://www.jd.com"
    When I search for <book_name>
    #And I buy the book
    Then I should see the book in returned results

  Examples:
    | book_name   |
    | "Steve Jobs"|
    | "Cucumber"  |
    | "TestNG"    |

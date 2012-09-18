Feature: Login
  In order to evaluate courses
  As a professor
  I must be able to securely login in with a username and password

  Scenario: Going to the login page.
    Given I am on "the home page"
    When I click "Login"
    Then I should be on "the login page"
    And I should see "Username"
    And I should see "Password"
    And I should see "Log In"

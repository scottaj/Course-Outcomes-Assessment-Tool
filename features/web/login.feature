
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

  Scenario: Logging in with correct credentials
    Given I am on "the login page"
    And the following admin user exists:
    | username   | tebowt   |
    | first_name | Tim      |
    | last_name  | Tebow    |
    | password   | abcd1234 |
    When I fill in "username" with "tebowt"
    And I fill in "password" with "abcd1234"
    And I click "Log In"
    Then I should be on "the homepage"
    And I should see "Tim Tebow"

  Scenario: Logging in with a non-existant username
    Given I am on "the login page"
    And the user "bradyt" does not exist
    When I fill in "username" with "bradyt"
    And I fill in "password" with "a1b2c3d4"
    And I click "Log In"
    Then I should be on "the login page"
    And I should see "Username or password not found"

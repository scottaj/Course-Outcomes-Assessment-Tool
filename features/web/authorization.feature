Feature: Role Based Authorization
  In order to secure our application
  As an administrator
  Some parts of the application must be only accessible to administrators

  Scenario: Going to protected routes as an administrator
    Given the following admin user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    Then I should see "Admin"
    When I click "Admin"
    Then I should be on "the admin page"
    When I navigate to "/admin/courses"
    Then I should be on "the course administration page"
    When I navigate to "/admin/student/create"
    Then I should be on "the student creation page"

  Scenario: Going to protected routes as a regular user
    Given the following normal user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    Then I should not see "Admin"
    When I navigate to "/admin"
    Then I should see "Hey! You aren't supposed to be here."
    When I navigate to "/admin/courses"
    Then I should see "Hey! You aren't supposed to be here."
    When I navigate to "/admin/student/create"
    Then I should see "Hey! You aren't supposed to be here."

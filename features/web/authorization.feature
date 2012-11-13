Feature: Role Based Authorization
  In order to secure our application
  As an administrator
  Some parts of the application must be only accessible to administrators

  Scenario: Going to protected routes as an administrator
    Given I am logged in as an admin
    Then I should see "Admin"
    When I click "Admin"
    Then I should be on "the admin page"
    When I navigate to "/admin/courses"
    Then I should be on "the course administration page"
    When I navigate to "/admin/student/create"
    Then I should be on "the student creation page"

  Scenario: Going to protected routes as a normal user
    Given I am logged in as a normal user
    Then I should not see "Admin"
    When I navigate to "/admin"
    Then I should see "Hey! You aren't supposed to be here."
    When I navigate to "/admin/courses"
    Then I should see "Hey! You aren't supposed to be here."
    When I navigate to "/admin/student/create"
    Then I should see "Hey! You aren't supposed to be here."

  Scenario: Visting another user's assessments as an admin
    Given the following normal user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following course exists:
    | course_name  |  Throwing |
    | course_title |    QB 101 |
    | term_number  |         1 |
    | term_year    |      2012 |
    | professor    | staffordm |
    And I am logged in as a normal user
    When I visit the assessment for the following course:
    | course_name  |  Throwing |
    | course_title |    QB 101 |
    | term_number  |         1 |
    | term_year    |      2012 |
    Then I should see "Hey! You aren't supposed to be here."
    And I should not see "QB 101"
    
  Scenario: Visting another user's assessments as a normal user
    Given the following normal user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following course exists:
    | course_name  |  Throwing |
    | course_title |    QB 101 |
    | term_number  |         1 |
    | term_year    |      2012 |
    | professor    | staffordm |
    And I am logged in as an admin user
    When I visit the assessment for the following course:
    | course_name  |  Throwing |
    | course_title |    QB 101 |
    | term_number  |         1 |
    | term_year    |      2012 |
    Then I should see "QB 101"
    And I should not see "Hey! You aren't supposed to be here."

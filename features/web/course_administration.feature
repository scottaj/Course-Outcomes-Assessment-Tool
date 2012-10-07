Feature: Course Administration
  In order to evaluate the outcomes of courses.
  As a professor
  I need to be able to create, modify, and archive courses

  Scenario: Viewing existing courses
    Given the following user exists:
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
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    Then I should be on "the course administration page"
    And I should see the following:
    | Term 1 2012      |
    | Course Title     |
    | Course Name      |
    | Section          |
    | Edit/Archive     |
    | Professor        |
    | QB 101           |
    | Throwing         |
    | 1                |
    | Matthew Stafford |
    

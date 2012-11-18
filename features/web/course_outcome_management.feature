Feature: Outcome Administration
  In order to evaluate the outcomes of courses.
  As a professor
  I need to be able to be able to create, edit, organize, and delete outcomes for my courses
  
  Scenario: Viewing existing outcomes for a course
    Given the following admin user exists:
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
    And the following program outcome exists:
    | outcome | program outcome |
    And the following outcome exists:
    | outcome          | test outcome    |
    | course           | QB 101          |
    | program_outcomes | program outcome |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "QB 101-1"
    Then I should be on "the course assessment page"
    And I should see the following:
    | QB 101       |
    | test outcome |
    | a            |
    | Throwing     |
    | 1.           |

  Scenario: Adding a new outcome to a course
    Given the following admin user exists:
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
    And the following program outcome exists:
    | outcome | program outcome 1 |
    And the following program outcome exists:
    | outcome | program outcome 2 |
    And the following program outcome exists:
    | outcome | program outcome 3 |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "QB 101-1"
    And I click "New Outcome"
    And I fill in "outcome" with "course outcome 1"
    And I select "a" for "program_outcomes"
    And I click "Create Outcome"
    Then I should be on "the course assessment page"
    And I should see the following:
    | 1.               |
    | course outcome 1 |
    | a                |


Feature: Course Survey Creation
  In order to evaluate my courses
  As a professor
  I need to be able to create surveys that my students can take

  Scenario: viewing survey questions
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
    And the following program outcome exists:
    | outcome | test outcome 1 |
    And the following program outcome exists:
    | outcome | test outcome 2 |
    And the following outcome exists:
    | outcome          | course outcome 1 |
    | program_outcomes | test outcome 1   |
    | course           | QB 101           |
    And the following outcome exists:
    | outcome          | course outcome 2 |
    | program_outcomes | test outcome 2   |
    | course           | QB 101           |
    And the following survey question exists
    | question | How are you doing? |
    | outcomes | course outcome 1   |
    | course   | QB 101             |
    And the following survey question exists
    | question | What is your name? |
    | outcomes | course outcome 2   |
    | course   | QB 101             |
    And the following survey question exists
    | question | Do you like Cabbage?               |
    | outcomes | course outcome 2, course outcome 1 |
    | course   | QB 101                             |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "QB 101-1"
    And I click "Student Surveys"
    Then I should see the following:
    | 1                    |
    | 2                    |
    | 1, 2                 |
    | How are you doing?   |
    | What is your name?   |
    | Do you like Cabbage? |

  Scenario: Creating new survey questions
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
    And the following program outcome exists:
    | outcome | test outcome 1 |
    And the following program outcome exists:
    | outcome | test outcome 2 |
    And the following outcome exists:
    | outcome          | course outcome 1 |
    | program_outcomes | test outcome 1   |
    | course           | QB 101           |
    And the following outcome exists:
    | outcome          | course outcome 2 |
    | program_outcomes | test outcome 2   |
    | course           | QB 101           |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "QB 101-1"
    And I click "Student Surveys"
    And I click "New Question"
    And I fill in "question" with "How does my hair look?"
    And I select "1" for "outcomes"
    And I click "Create Question"
    Then I should see the following:
    | How does my hair look? | 1 |

  Scenario: Deleting survey questions
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
    And the following program outcome exists:
    | outcome | test outcome 1 |
    And the following program outcome exists:
    | outcome | test outcome 2 |
    And the following outcome exists:
    | outcome          | course outcome 1 |
    | program_outcomes | test outcome 1   |
    | course           | QB 101           |
    And the following outcome exists:
    | outcome          | course outcome 2 |
    | program_outcomes | test outcome 2   |
    | course           | QB 101           |
    And the following survey question exists
    | question | How are you doing? |
    | outcomes | course outcome 1   |
    | course   | QB 101             |
    And the following survey question exists
    | question | What is your name? |
    | outcomes | course outcome 2   |
    | course   | QB 101             |
    And the following survey question exists
    | question | Do you like Cabbage?               |
    | outcomes | course outcome 2, course outcome 1 |
    | course   | QB 101                             |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "QB 101-1"
    And I click "Student Surveys"
    And I click the item with attribute "#delete-1"
    Then I should see "What is your name?"
    And I should not see "How are you doing?"

  Scenario: Editing a survey question

  Scenario: Locking and unlocking a survey

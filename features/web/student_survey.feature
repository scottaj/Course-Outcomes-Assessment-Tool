Feature: Completing a student survey
  In order to evaluate my course
  As a professor
  I need to survey my students to see what they learned

  Scenario: Logging into the the survey subsystem as a student
    Given the following student exists:
    | student_id | T01112223 |
    | first_name | Bill      |
    | last_name  | Cosby     |
    And I am on "the student survey login page"
    And I fill in "student_id" with "T01112223"
    And I click "Log In"
    Then I should be on "the student survey selection page"

  Scenario: Logging into the the survey subsystem with an invalid student ID
    Given the following student does not exist:
    | student_id | T09879876 |
    And I am on "the student survey login page"
    And I fill in "student_id" with "T09879876"
    And I click "Log In"
    Then I should be on "the student survey login page"
    And I should see "Student ID not found"

Feature: Student course assignment
  To enable students to take course evaluations
  As a professor
  I should be able to move and remove students from courses I teach
  
  Scenario: Going to assessment page as a professor
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
    Then I should be on "the home page"
    Then I should see "CSSE 171-1"
    When I click "CSSE 171-1"
    Then I should be on "the assessment page"
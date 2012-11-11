Feature: Program Outcome Adminstartion
  In order to evaluate the outcome of courses
  As a professor
  I must be able to create, modify, and delete outcomes for my program.

  Scenario: Viewing existing program outcomes
    Given the following admin user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following program outcome exists:
    | outcome | test outcome for a program |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Program Outcomes"
    Then I should be on "the program outcome administration page"
    And I should see the following:
    | a.                         |
    | test outcome for a program |

  Scenario: Creating a new program outcome
    Given the following admin user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following program outcome exists:
    | outcome | test outcome for a program |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Program Outcomes"
    And I click "New Outcome"
    Then I should be on "the new program outcome page"
    When I fill in "outcome" with "being a BAMF"
    And I click "Create Outcome"
    Then I should be on "the program outcome administration page"
    And I should see the following:
    | being a BAMF |
    | b.           |

  Scenario: Editing an existing program outcome
    Given the following admin user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following program outcome exists:
    | outcome | test outcome for a program |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Program Outcomes"
    And I click the item with attribute "#a-edit"
    Then I should be on "the edit program outcome page"
    When I fill in "outcome" with "Being a BAMF"
    And I click "Save"
    Then I should be on "the program outcome administration page"
    And I should not see "test outcome for a program"
    And I should see "Being a BAMF"

  Scenario: Deleting an existing program outcome
    Given the following admin user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following program outcome exists:
    | outcome | test outcome for a program |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Program Outcomes"
    And I click the item with attribute "#a-delete"
    Then I should be on "the program outcome administration page"
    And I should not see the following:
    | test outcome for a program |
    | a.                         |

  Scenario: Promoting and demoting existing program outcome
    Given the following admin user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And the following program outcome exists:
    | outcome | test outcome for a program |
    And the following program outcome exists:
    | outcome | Whuddup                    |
    And the following program outcome exists:
    | outcome | Yoyoyo                     |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Program Outcomes"
    Then I should see the following outcomes:
    | enum | outcome                    |
    | a.   | test outcome for a program |
    | b.   | Whuddup                    |
    | c.   | Yoyoyo                     |
    When I click the item with attribute "#b-promote"
    Then I should see the following outcomes:
    | enum | outcome                    |
    | a.   | Whuddup                    |
    | b.   | test outcome for a program |
    | c.   | Yoyoyo                     |
    When I click the item with attribute "#b-demote"
    Then I should see the following outcomes:
    | enum | outcome                    |
    | a.   | Whuddup                    |
    | b.   | Yoyoyo                     |
    | c.   | test outcome for a program |

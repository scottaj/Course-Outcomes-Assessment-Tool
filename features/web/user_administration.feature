Feature: User Administration
  In order to facilitate access to the system
  As an administrator
  I need to be able to create, modify and delete users

  Scenario: Viewing current users
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And the following user exists:
    | username   | rodgersa |
    | first_name | Aaron    |
    | last_name  | Rodgers  |
    | password   | wxyz9876 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Users"
    And I should see "Username"
    And I should see "First Name"
    And I should see "Last Name"
    And I should see "manningp"
    And I should see "Peyton"
    And I should see "Manning"
    And I should see "rodgersa"
    And I should see "Aaron"
    And I should see "Rodgers"
    
    
  Scenario: Adding a new user

  Scenario: Deleting an existing user

  Scenario: Changing an existing user's name
  
  Scenario: Changing an existing user's password

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
    Then I should be on "the user administration page"
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
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And the user "ryant" does not exist
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Users"
    And I click "Add User"
    Then I should be on "the add user page"
    When I fill in "username" with "ryant"
    And I fill in "first_name" with "Matt"
    And I fill in "last_name" with "Ryan"
    And I fill in "password" with "abcd1234"
    And I click "Create User"
    Then I should be on "the user administration page"
    And I should see "ryant"
    And I should see "Matt"
    And I should see "Ryan"

  
    
  Scenario: Deleting an existing user

    
  Scenario: Changing an existing user's name

    
  Scenario: Changing an existing user's password

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
    And I fill in "password_confirmation" with "abcd1234"
    And I click "Create User"
    Then I should be on "the user administration page"
    And I should see "ryant"
    And I should see "Matt"
    And I should see "Ryan"

    
  Scenario: Trying to create a user with an invalid password (too short)
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
    When I fill in "username" with "ryant"
    And I fill in "first_name" with "Matt"
    And I fill in "last_name" with "Ryan"
    And I fill in "password" with "p00p"
    And I fill in "password_confirmation" with "p00p"
    And I click "Create User"
    Then I should be on "the add user page"
    And I should see "Password must be at least 8 characters"
    
  Scenario: Trying to create a user with an invalid password (password confirmation failed)
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
    When I fill in "username" with "ryant"
    And I fill in "first_name" with "Matt"
    And I fill in "last_name" with "Ryan"
    And I fill in "password" with "4321poop"
    And I fill in "password_confirmation" with "1234poop"
    And I click "Create User"
    Then I should be on "the add user page"
    And I should see "Entered password does not match"

  Scenario: Trying to create a user with an invalid password (no letters)
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
    When I fill in "username" with "ryant"
    And I fill in "first_name" with "Matt"
    And I fill in "last_name" with "Ryan"
    And I fill in "password" with "01234567"
    And I fill in "password_confirmation" with "01234567"
    And I click "Create User"
    Then I should be on "the add user page"
    And I should see "Password must contain one or more letters"

  Scenario: Trying to create a user with an invalid password (no numbers/symbols)
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
    When I fill in "username" with "ryant"
    And I fill in "first_name" with "Matt"
    And I fill in "last_name" with "Ryan"
    And I fill in "password" with "abcdefgh"
    And I fill in "password_confirmation" with "abcdefgh"
    And I click "Create User"
    Then I should be on "the add user page"
    And I should see "Password must contain one or more numbers or symbols"

  Scenario: Trying to create a user without a username
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
    When I fill in "first_name" with "Matt"
    And I fill in "last_name" with "Ryan"
    And I fill in "password" with "abcdefgh"
    And I fill in "password_confirmation" with "abcdefgh"
    And I click "Create User"
    Then I should be on "the add user page"
    And I should see "You must specify a username"
    
  @javascript
  Scenario: Deactivating an existing user
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
    And I click the item with attribute "#rodgersa-delete"
    Then I should be on "the user administration page"
    When I click "Show Deactivated"
    Then I should see "Active"
    And I should see "Deactivated Users"
    And I should see "Aaron"
    And I should see "Rodgers"
		
		
    
  Scenario: Changing an existing user's name
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
    And I click the item with attribute "#rodgersa-edit"
    Then I should be on "the edit user page" with attribute "rodgersa"
    And I should see "First name"
    And I should see "Last name"
    When I fill in "first_name" with "Harry"
    And I fill in "last_name" with "Truman"
    And I click "Save"
    Then I should be on "the edit user page" with attribute "rodgersa"
    And I should see "rodgersa"
    And I should see "Harry"
    And I should see "Truman"
    
   @javascript
  Scenario: Reactivating a user
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
    And I click the item with attribute "#rodgersa-delete"
    Then I should be on "the user administration page"
    And I should see "Show Deactivated"
    And I should see "Add User"
    When I click "Show Deactivated"
    And I click the item with attribute "#rodgersa-delete"
    Then I should be on "the user administration page" with attribute "rodgersa"
    When I log out
    And I am logged in as the user "rodgersa" with the password "wxyz9876"
    Then I should be on "the homepage"
    
    Scenario: Changing an existing user's password
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
    And I click the item with attribute "#rodgersa-edit"
    Then I should be on "the edit user page" with attribute "rodgersa"
    And I should see "New password"
    And I should see "Password confirmation"
    When I fill in "new_password" with "9876wxyz"
    And I fill in "password_confirmation" with "9876wxyz"
    And I click "Save"
    Then I should be on "the edit user page" with attribute "rodgersa"
    And I should see "rodgersa"

 

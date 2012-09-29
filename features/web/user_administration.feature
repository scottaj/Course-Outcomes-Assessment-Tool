Scenario: User Administration
  In order to facilitate access to the system
  As an administrator
  I need to be able to create, modify and delete users

  Feature: Viewing current users
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click on "Admin"
    And I click on "Users"
    Then I should see ""
    
  Feature: Adding a new user

  Feature: Deleting an existing user

  Feature: Changing an existing user's name
  
  Feature: Changing an existing user's password

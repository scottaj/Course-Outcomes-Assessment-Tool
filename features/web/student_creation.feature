Feature: Student Creation
  In order to put students in the system
  As an administrator
  I need to be able to create and modify students.
  
  
  Scenario: Viewing current students
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Students"
    Then I should be on "the students page"
    And I should see "First Name"
    And I should see "Last Name"
    And I should see "T-Number"
    And I should see "Edit"
    And I should see "New Student"
    
  Scenario:  Trying to change a student's T-Number (T-Number too short)
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And the following student exists:
    | first_name | Titus |
    | last_name  | Young |
    | student_id | T08765432 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Students"
    Then I should be on "the students page"
    And I click the item with attribute "#student-edit"
    Then I should be on "the edit students page"
    And I should see "Edit Student"
    And I should see "First name"
    And I should see "Last name"
    And I should see "Student"
    When I fill in "student_id" with "989"
    And I click "Save"
    Then I should be on "the edit students page"
    And I should see "T-Number format must be T########"
    
  Scenario: Creation of a new student
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Students"
    Then I should be on "the students page"
    And I click "New Student"
    Then I should be on "the student creation page"
    And I should see "New Student"
    And I should see "First name"
    And I should see "Last name"
    And I should see "Student"
    When I fill in "first_name" with "Joe"
    And I fill in "last_name" with "Louis"
    And I fill in "student_id" with "T01771459"
    And I click "Create Student"
    Then I should be on "the students page"
    And I should see "Joe"
    And I should see "Louis"
    And I should see "T01771459"
    
  
  Scenario: Trying to change a student's T-Number (same T-Number)
    Given the following user exists:
    | username   | manningp |
    | first_name | Peyton   |
    | last_name  | Manning  |
    | password   | a1b2c3d4 |
    And the following student exists:
    | first_name | Titus |
    | last_name  | Young |
    | student_id | T08765432 |
    And the following student exists:
    | first_name | Calvin |
    | last_name  | Johnson |
    | student_id | T03459812 |
    And I am logged in as the user "manningp" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Students"
    Then I should be on "the students page"
    And I click the item with attribute "#student-edit"
    Then I should be on "the edit students page"
    And I should see "Edit Student"
    And I should see "First name"
    And I should see "Last name"
    And I should see "Student"
    When I fill in "student_id" with "T08765432"
    And I click "Save"
    Then I should be on "the edit students page"
    And I should see "T-Number must be unique!"
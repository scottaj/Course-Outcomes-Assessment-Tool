Feature: Course Administration
  In order to evaluate the outcomes of courses.
  As a professor
  I need to be able to create, modify, and archive courses

  Scenario: Viewing existing courses
    Given the following user exists:
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
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    Then I should be on "the course administration page"
    And I should see the following:
    | Term 1 2012      |
    | Course Title     |
    | Course Name      |
    | Section          |
    | Edit/Archive     |
    | Professor        |
    | QB 101           |
    | Throwing         |
    | 1                |
    | Matthew Stafford |
    
  Scenario: Creating courses
    Given the following user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    And I click "New Course"
    Then I should be on "the course creation page"
    When I fill in "course_title" with "QB 240"
    And I fill in "course_name" with "Not Getting Sacked"
    And I fill in "section" with "1"
    And I fill in "term_number" with "1"
    And I select "2012" for "term_year"
    And I select "Matthew Stafford" for "professor"
    And I click "Create Course"
    Then I should be on "the course administration page"
    And I should see the following:
    | Term 1 2012        |
    | QB 240             |
    | Not Getting Sacked |
    | 1                  |
    | Matthew Stafford   |

  Scenario: Trying to create a course with missing fields (course title)
    Given the following user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    And I click "New Course"
    And I fill in "course_name" with "Not Getting Sacked"
    And I fill in "section" with "1"
    And I fill in "term_number" with "1"
    And I select "2012" for "term_year"
    And I select "Matthew Stafford" for "professor"
    And I click "Create Course"
    Then I should be on "the course creation page"
    And I should see "Please enter all required fields"

  Scenario: Trying to create a course with missing fields (course name)
    Given the following user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    And I click "New Course"
    And I fill in "course_title" with "QB 240"
    And I fill in "section" with "1"
    And I fill in "term_number" with "1"
    And I select "2012" for "term_year"
    And I select "Matthew Stafford" for "professor"
    And I click "Create Course"
    Then I should be on "the course creation page"
    And I should see "Please enter all required fields"

  Scenario: Trying to create a course with missing fields (term_number)
    Given the following user exists:
    | username   | staffordm |
    | first_name | Matthew   |
    | last_name  | Stafford  |
    | password   | a1b2c3d4  |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    And I click "New Course"
    And I fill in "course_name" with "Not Getting Sacked"
    And I fill in "section" with "1"
    And I fill in "course_title" with "QB 240"
    And I select "2012" for "term_year"
    And I select "Matthew Stafford" for "professor"
    And I click "Create Course"
    Then I should be on "the course creation page"
    And I should see "Please enter all required fields"

  Scenario: Archiving courses
    Given the following user exists:
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
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    And I click the item with attribute "#qb101-1-1-2012-archive"
    Then I should be on "the course administration page"
    And I should not see "QB 101"

  @javascript  
  Scenario: Viewing archived courses
    Given the following user exists:
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
    And the following course exists:
    | course_name  | Not Getting Sacked |
    | course_title | QB 240             |
    | term_number  | 1                  |
    | term_year    | 2011               |
    | professor    | staffordm          |
    | archived     | true               |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    Then I should not see the following:
    | QB 240             |
    | Not Getting Sacked |
    | Term 1 2011        |
    And I click "Show Archived"
    Then I should see the following:
    | QB 240             |
    | Not Getting Sacked |
    | Term 1 2011        |
    | Hide Archived      |
    | Archived Courses   |

  @javascript
  Scenario: Unarchiving courses
    Given the following user exists:
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
    And the following course exists:
    | course_name  | Not Getting Sacked |
    | course_title | QB 240             |
    | term_number  | 1                  |
    | term_year    | 2011               |
    | professor    | staffordm          |
    | archived     | true               |
    And I am logged in as the user "staffordm" with the password "a1b2c3d4"
    When I click "Admin"
    And I click "Courses"
    And I click "Show Archived"
    And I click the item with attribute "#qb240-1-1-2011-archive"
    And I refresh the page
    Then I should see the following:
    | Term 1 2011        |
    | QB 240             |
    | Not Getting Sacked |

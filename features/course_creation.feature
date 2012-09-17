Feature: Course Creation
  In order to evaulate course outcomes
	As a professor
	I want to be able to create a course
	
    Scenario: Viewing the Course Creation page
      Given I have logged in as a professor with username "testprofessor" and password "testpassword"
      And I am on the homepage
      When I press "Create Course" 
      Then I should be on the Create Course page
      And I should see "Create a New Course"
      And I should see "Course Number"
      And I should see "Course Name"
      And I should see "Instructor"
      And I should see "Section"
	
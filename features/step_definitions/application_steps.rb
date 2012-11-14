require_relative '../support/application_paths'

Given /^I am on "(.*?)"$/ do |page_name|
  visit get_path(page_name)
end

Given /^the following admin user exists:$/ do |table|
  user_attr = table.rows_hash
  user = User.new
  
  user_attr.each {|attr, value| user[attr] = value}

  user.role = :admin
  user.should be_valid
  user.save
end

Given /^the following normal user exists:$/ do |table|
  user_attr = table.rows_hash
  user = User.new
  
  user_attr.each {|attr, value| user[attr] = value}

  user.role = :user
  user.should be_valid
  user.save
end

Given /^the following student exists:$/ do |table|
  student_attr = table.rows_hash
  student = Student.new
  
  student_attr.each {|attr, value| student[attr] = value}
  
  student.should be_valid
  student.save
end

Given /^the following student does not exist:$/ do |table|
  student_attr = table.rows_hash
  Student.where(student_attr).first.should be_nil
end


Given /^the user "(.*?)" does not exist$/ do |username|
  User.where(username: username).first.should be_nil
end

Given /^I am logged in as the user "(.*?)" with the password "(.*?)"$/ do |username, password|
  visit '/login'
  fill_in "username", with: username
  fill_in "password", with: password
  click_on "Log In"
  current_path.should == "/homepage"
end

Given /^the following course exists:$/ do |table|
  course_attr = table.rows_hash
  course = Course.new

  course_attr["professor"] = User.find_by_username(course_attr["professor"])
  
  course_attr.each {|attr, value| course.send(:"#{attr}=", value)}

  course.should be_valid
  course.save
end

Given /^the following outcome exists:$/ do |table|
  outcome_attr = table.rows_hash
  outcome = Outcome.new

  outcome_attr["course"] = Course.find_by_course_title(outcome_attr["course"])

  outcome_attr["program_outcomes"] = outcome_attr["program_outcomes"].split(',').map {|outcome| ProgramOutcome.find_by_outcome(outcome)}

  outcome_attr.each {|attr, value| outcome.send(:"#{attr}=", value)}
  outcome.should be_valid
  outcome.save
end

Given /^the following program outcome exists:$/ do |table|
  program_outcome_attr = table.rows_hash
  program_outcome = ProgramOutcome.new

  program_outcome_attr.each {|attr, value| program_outcome.send(:"#{attr}=", value)}
  program_outcome.should be_valid
  program_outcome.save
end

Given /^I am logged in as a normal user$/ do
  u = User.create(username: "reynoldsb", password: "abcd1234", role: :user)
  visit "/login"
  fill_in "username", with: u.username
  fill_in "password", with: "abcd1234"
  click_on "Log In"
end

Given /^I am logged in as an admin user$/ do
  u = User.create(username: "mcqueens", password: "abcd1234", role: :admin)
  visit "/login"
  fill_in "username", with: u.username
  fill_in "password", with: "abcd1234"
  click_on "Log In"
end

When /^I visit the assessment for the following course:$/ do |table|
  course_params = table.rows_hash

  id = Course.where(course_params).first.id
  visit "/assessment/#{id}"
end

When /^I wait "(.*?)" seconds$/ do |time|
  sleep(time.to_f)
end

When /^I select "(.*?)" for "(.*?)"$/ do |content, select|
  page.select content, from: select
end

When /^I refresh the page$/ do
  visit current_path
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, data|
  fill_in field, with: data
end

When /^I click "(.*?)"$/ do |item|
  click_on item
end

When /^I click the item with attribute "(.*?)"$/ do |attr|
  find(attr).click
end

When /^I log out$/ do
  click_on "Logout"
end

When /^I navigate to "(.*?)"$/ do |url|
  visit url
end

Then /^I should not be on "(.*?)"$/ do |page|
  current_path.should_not == get_path(page)
end

Then /^I should not see "(.*?)"$/ do |content|
  page.should_not have_content(content)
end

Then /^I should see the following:$/ do |table|
  table.raw.flatten.each {|content| page.should have_content(content)}
end

Then /^I should not see the following:$/ do |table|
  table.raw.flatten.each {|content| page.should_not have_content(content)}
end

Then /^I should be on "([^\"]*?)" with attribute "(.*?)"$/ do |page_name, attr|
  current_path.should match(get_path(page_name, attr))
end

Then /^I should be on "([^\"]*?)"$/ do |page_name|
  current_path.should match(get_path(page_name))
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content(content)
end

Then /^user "(.*?)" should not be an admin$/ do |username|
  User.find_by_username(username).should_not be_admin
end


Then /^I should see the following outcomes:$/ do |table|
  rows = table.hashes

  found_enum = false
  found_outcome = false
  rows.each do |row|
    all("tr").each do |tr|
      begin
        found_enum = true
        tr.should have_content(row[:enum])
      rescue
        found_enum = false
        found_outcome = false
      end
      begin
        found_outcome = true
        tr.should have_content(row[:outcome])
      rescue
        found_enum = false
        found_outcome = false
      end
      break if found_enum and found_outcome
    end

    raise "Matching row not found!" unless found_enum and found_outcome
  end
end

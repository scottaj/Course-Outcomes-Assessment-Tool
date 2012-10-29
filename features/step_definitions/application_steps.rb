require_relative '../support/application_paths'

Given /^I am on "(.*?)"$/ do |page_name|
  visit get_path(page_name)
end

Given /^the following user exists:$/ do |table|
  user_attr = table.rows_hash
  user = User.new
  
  user_attr.each {|attr, value| user[attr] = value}

  user.should be_valid
  user.save
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

When /^I click on "(.*?)"$/ do |selector|
  page.execute_script("jQuery(#{selector.to_json}).click();") #This line allows you to call a jQuery click event on any object on the page.
end

When /^I click the item with attribute "(.*?)"$/ do |attr|
  find(attr).click
end

When /^I log out$/ do |item|
	find("Logout").click
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

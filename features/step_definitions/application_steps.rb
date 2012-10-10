require_relative '../support/application_paths'

Given /^I am on "(.*?)"$/ do |page_name|
  visit get_path(page_name)
end

Given /^the following user exists:$/ do |table|
  user_attr = table.rows_hash
  user = User.new
  
  user_attr.each {|attr, value| user[attr] = value}
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
  course.save
end

When /^I select "(.*?)" for "(.*?)"$/ do |content, select|
  page.select content, from: select
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

Then /^I should not see "(.*?)"$/ do |content|
  page.should_not have_content(content)
end

Then /^I should see the following:$/ do |table|
  table.raw.flatten.each {|content| page.should have_content(content)}
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

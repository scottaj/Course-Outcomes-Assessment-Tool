require_relative '../support/application_paths'

Given /^I am on "(.*?)"$/ do |page_name|
  visit get_path(page_name)
end

Given /^the following user exists:$/ do |table|
  user_attr = table.rows_hash
  user = User.new
  user.username = user_attr[:username]
  user.first_name = user_attr[:first_name]
  user.last_name = user_attr[:last_name]
  user.password = user_attr[:password]
  user.save
end

Given /^the user "(.*?)" does not exist$/ do |username|
  User.where(username: username).first.should be_nil
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, data|
  fill_in field, with: data
end

When /^I click "(.*?)"$/ do |item|
  click_on item
end

Then /^I should be on "(.*?)"$/ do |page_name|
  current_path.should == get_path(page_name)
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content(content)
end

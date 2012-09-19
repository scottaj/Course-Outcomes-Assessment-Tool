require_relative '../support/application_paths'

Given /^I am on "(.*?)"$/ do |page_name|
  visit get_path(page_name)
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

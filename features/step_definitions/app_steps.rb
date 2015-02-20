## GIVEN ##################################################

Given /^that I am on home page$/ do
  visit '/'
end

Given /^I can get to the (.*) entry page$/ do |word|
  visit "/#{word}.php"
end

## WHEN ##################################################

When /^I enter the date (.*)$/ do |date|
  fill_in "date", :with => "#{date}"
end

When /^I enter the date "([^"]*\])"$/ do |date|
  fill_in "date", :with => date
end

When /^I push "Submit" button$/ do
  find_button('Submit').click
end

When /^I select the "(.*?)" as "(.*?)"$/ do |id, value|
  page.select value, :from => id
end

When /^I enter the quality "([^"]*)"$/ do |quality|
  page.select quality, :from => "quality"
end

When /^I enter the amount received (.*)$/ do |amount|
  fill_in "amount", :with => amount
end

## THEN ##################################################

Then /^the response should succesfully$/ do
   page.should_not have_content "ERROR"
end

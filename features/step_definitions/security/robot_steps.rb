Given(/^I am viewing the robots\.txt page$/) do
  visit "/robots.txt"
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end
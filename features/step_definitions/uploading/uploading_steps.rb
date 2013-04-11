When(/^I paste my diff file into the text box$/) do
  fill_in "code_review_raw", with: @file
end

When(/^I click upload$/) do
  click_button 'Upload'
end

Then(/^I should be redirected to a page showing my review$/) do
  # response.should be_success
  step "I should see 1 diff section"
  step "I should see the original line numbers 1-6"
  step "I should see the modified line numbers 1-5"
end

Then(/^I should be redirected to the homepage$/) do
  current_url.should == code_reviews_url
end

Then(/^I should see an error message$/) do
  page.should have_content("Whoops! That appears to be an invalid diff")
end
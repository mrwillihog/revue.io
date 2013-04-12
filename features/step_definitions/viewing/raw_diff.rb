Then(/^I should see a raw download link$/) do
  page.should have_link('raw', code_review_path(@review, format: :diff))
end

When(/^I click the raw download link$/) do
  click_link('raw')
end

Then(/^I should see the original diff$/) do
  page.should have_content(@review.raw)
end
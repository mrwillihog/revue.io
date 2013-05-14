Then(/^I should see a raw download link$/) do
  page.should have_link('raw', code_review_path(@review, format: :diff))
end

When(/^I click the raw download link$/) do
  click_link('raw')
end

Then(/^I should see the original diff$/) do
  page.should have_content(@review.raw)
end

Then(/^I should download the original diff as a patch$/) do
  page.should have_content(@review.raw)
  page.response_headers['Content-Disposition'].should include("filename=\"revue-#{@review.token}.patch\"")
end
Then(/^I should see a patch download link$/) do
  page.should have_link('download patch', code_review_path(@review, format: :patch))
end

When(/^I click the patch download link$/) do
  click_link('download patch')
end

Then(/^I should download the original diff as a patch$/) do
  page.should have_content(@review.raw)
  page.response_headers['Content-Disposition'].should include("filename=\"revue-#{@review.token}.patch\"")
end
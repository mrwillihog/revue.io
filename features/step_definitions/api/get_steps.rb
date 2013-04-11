When(/^I try to get it via the API$/) do
  get "/api/v1/#{@review.token}.json"
end

Then(/^I should recieve the diff content$/) do
  response = JSON.parse(last_response.body)
  response['content'].should have_content(@review.raw)
end

Then(/^I should recieve the expiry date$/) do
  response = JSON.parse(last_response.body)
  response['expires_at'].should_not be_nil
end

Then(/^I should experience a half second delay before I get a 404 response from the API$/) do
  start_time = Time.now
  expect {
    get "/api/v1/#{@review.token}.json"
  }.to raise_error(ActiveRecord::RecordNotFound)
  end_time  = Time.now
  (end_time - start_time).should >= 0.5.seconds
end
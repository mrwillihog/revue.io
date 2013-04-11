When(/^I post it via the API$/) do
  post "/api/v1.json", { content: @file }, type: :json
end

Then(/^I should recieve a URL as a response$/) do
  response = JSON.parse(last_response.body)
  response['url'].should_not be_nil
end
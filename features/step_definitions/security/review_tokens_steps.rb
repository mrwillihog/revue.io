Then(/^I should not be able to access it at '\/:id'$/) do
  expect {
    visit "/#{@review.id}"
  }.to raise_error(ActiveRecord::RecordNotFound)
end

Then(/^I should be able to access it at '\/:token'$/) do
  expect {
    visit "/#{@review.token}"
  }.not_to raise_error
end
Then(/^I should not experience a delay when I view it$/) do
  start_time = Time.now
  visit code_review_path(@review)
  end_time = Time.now
  (end_time - start_time).should <= 0.5.seconds
end

Given(/^I guess a hash$/) do
  @review = FactoryGirl.build :simple
  @review.token = SecureRandom.urlsafe_base64
end

Then(/^I should experience a half second delay before I get a 404 response$/) do
  start_time = Time.now
  expect {
    visit code_review_path(@review)
  }.to raise_error(ActiveRecord::RecordNotFound)
  end_time  = Time.now
  (end_time - start_time).should >= 0.5.seconds
end
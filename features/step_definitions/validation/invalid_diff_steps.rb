Given(/^a diff with (.*?)$/) do |file|
  @review = FactoryGirl.build file.gsub(' ', '_').to_sym
end

When(/^I save it$/) do
  @review.save
end

Then(/^it should be invalid$/) do
  @review.should be_invalid
end

Then(/^it should not be persisted to the database$/) do
  CodeReview.all.count.should be_zero
end
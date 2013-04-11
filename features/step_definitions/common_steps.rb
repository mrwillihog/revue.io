Given(/^I am on the homepage$/) do
  @review = FactoryGirl.create :simple
  visit '/'
end

Given(/^an? (.*?) review$/) do |review_type|
  @review = FactoryGirl.create("#{review_type.gsub(' ', '_')}".to_sym)
end

Given(/^a review of a new file$/) do
  @review = FactoryGirl.create(:new_file)
end

Given(/^I have a valid diff file$/) do
  @file = IO.read(File.join(::Rails.root, 'spec', 'factories', 'diffs', 'simple.diff'))
end

Given(/^I have an invalid diff file$/) do
  @file = IO.read(File.join(::Rails.root, 'spec', 'factories', 'diffs', 'invalid', 'no_modifications.diff'))
end

When(/^I am reviewing it$/) do
  visit code_review_path(@review)
end
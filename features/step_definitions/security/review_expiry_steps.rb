Given(/^the expiry date has passed$/) do
  Timecop.travel(Time.now + 6.hours)
end

Given(/^I run the clean expired reviews task$/) do
  require 'rake'
  @rake = Rake::Application.new
  Rake.application = @rake
  Rake.application.rake_require "tasks/revue"
  @rake['revue:purge'].execute
end

Then(/^there should be (#{CAPTURE_NUMBER}) reviews? left$/) do |count|
  CodeReview.all.count.should == count
end
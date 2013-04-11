Then(/^I should see (#{CAPTURE_NUMBER}) diff sections?$/) do |num|
  page.all('section.diff').count.should == num
end

Then(/^I should see the following lines:$/) do |table|
  lines = page.all('section.diff .line .line_content').map { |row| [row.text.strip] }
  table.diff! lines
end

Then(/^I should see the following filenames?:$/) do |table|
  # Map the filename elements to a 2D array so we can use table.diff!
  titles = page.all(".filename").map { |row| [row.text.strip] }
  table.diff!(titles)
end

Then(/^I should see the filename "(.*?)"$/) do |filename|
  page.find('.filename').should have_content(filename)
end

Then(/^the diff bar should be completely green$/) do
  page.find('.diff_bar').should have_css('.none')
end

Then(/^the diff bar should be completely red$/) do
  page.find('.diff_bar').should have_css('.full')
end

Then(/^the diff bar should be half red and half green$/) do
  page.find('.diff_bar').should have_css('.half')
end

Then(/^the diff bar should be more red than green$/) do
  page.find('.diff_bar').should have_css('.three_quarters')
end

Then(/^the diff bar should be more green than red$/) do
  page.find('.diff_bar').should have_css('.quarter')
end

Then(/^I should see the expiry date$/) do
  page.find('.expiry').should have_content('6 hours')
end


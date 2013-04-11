Then(/^I should see (#{CAPTURE_NUMBER}) chunks?$/) do |num|
  # We expect to see a header before each chunk
  page.all('section.diff .chunk_separator').count.should == num
end

Then(/^I should see the following chunk headers?:$/) do |table|
  chunk_headers = page.all('section.diff .chunk_header').map { |row| [row.text.strip] }
  table.diff! chunk_headers
end
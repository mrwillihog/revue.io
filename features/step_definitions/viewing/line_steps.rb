Then(/^I should see the following (additions|deletions) highlighted:$/) do |change_type, table|
  modifications = page.all(".#{change_type.gsub(/s$/, '')}.line .line_content").map { |row| [row.text.strip] }
  table.diff!(modifications)
end

Then(/^I should see the (original|modified) line numbers (#{CAPTURE_RANGE})$/) do |line_type, line_range|
  line_numbers = page.all(".line_number.#{line_type}").map { |l| l.text.strip }
  line_numbers.reject! { |l| l.empty? }
  line_numbers.map! { |l| l.to_i }
  line_numbers.should == line_range.to_a
end

Then(/^I should see no (original|modified) line numbers$/) do |line_type|
  line_numbers = page.all(".line_number.#{line_type}").map { |l| l.text.strip }
  line_numbers.reject! { |l| l.empty? }
  line_numbers.should be_empty
end

Then(/^I should see (#{CAPTURE_NUMBER}) (additions|deletions)$/) do |num_lines, line_type|
  page.all(".line.#{line_type.gsub('s', '')}").count.should == num_lines
end
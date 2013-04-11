CAPTURE_NUMBER = Transform(/^\d+$/) do |num|
  num.to_i
end

CAPTURE_RANGE = Transform(/^(\d+)-(\d+)$/) do |start_line, end_line|
  (start_line.to_i)..(end_line.to_i)
end
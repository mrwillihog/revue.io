require 'revue/line'

FactoryGirl.define do
  factory :line, class: Revue::Line do
    initialize_with { new(raw, line_numbers) }

    factory :additional_line do |f|
      f.line_numbers {{modified: 1}}
      f.raw "+ a new line"
    end

    factory :additional_empty_line do |f|
      f.line_numbers {{modified: 1}}
      f.raw "+\n"
    end

    factory :deleted_line do |f|
      f.line_numbers {{original: 2}}
      f.raw "- an old line"
    end

    factory :deleted_empty_line do |f|
      f.line_numbers {{original: 1}}
      f.raw "-\n"
    end

    factory :unchanged_line do |f|
      f.line_numbers {{modified: 3, original: 3}}
      f.raw " unchanged"
    end

    factory :no_new_line do |f|
      f.line_numbers {{modified: nil, original: nil}}
      f.raw "\ No newline at end of file"
    end
  end
end
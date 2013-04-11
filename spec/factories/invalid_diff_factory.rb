require 'revue/diff'

def read_diff_file(filename)
  IO.read(File.expand_path("../diffs/#{filename}", __FILE__))
end

FactoryGirl.define do
  factory :invalid_code_review, class: CodeReview do
    factory :no_original_file_header do |f|
      f.raw read_diff_file "invalid/no_original_file_header.diff"
    end
    factory :no_modified_file_header do |f|
      f.raw read_diff_file "invalid/no_original_file_header.diff"
    end
    factory :no_content do |f|
      f.raw read_diff_file "invalid/no_content.diff"
    end
    factory :no_chunk_header do |f|
      f.raw read_diff_file "invalid/no_chunk_header.diff"
    end
    factory :no_modifications do |f|
      f.raw read_diff_file "invalid/no_modifications.diff"
    end
  end
end
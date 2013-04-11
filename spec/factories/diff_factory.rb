require 'revue/diff'

def read_diff_file(filename)
  IO.read(File.expand_path("../diffs/#{filename}", __FILE__))
end

FactoryGirl.define do
  factory :diff, class: Revue::Diff do
    initialize_with { new(raw) }

    factory :simple_diff do |f|
      f.raw read_diff_file "simple.diff"
    end

    factory :diff_with_modified_filename do |f|
      f.raw read_diff_file "modified_filename.diff"
    end

    factory :two_chunk_diff do |f|
      f.raw read_diff_file "multi_chunk.diff"
    end

    factory :diff_with_commit_revision do |f|
      f.raw read_diff_file "commit_revision.diff"
    end

    factory :new_file_diff do |f|
      f.raw read_diff_file "new_file.diff"
    end

    factory :removed_file_diff do |f|
      f.raw read_diff_file "removed_file.diff"
    end

    factory :git_diff do |f|
      f.raw read_diff_file "simple_git.diff"
    end

    factory :diff_with_null_original_filename do |f|
      f.raw read_diff_file "null_git.diff"
    end
  end
end
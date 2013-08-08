FactoryGirl.define do
  factory :code_review, class: CodeReview do
    factory :simple do |f|
      f.raw read_diff_file "simple.diff"
    end

    factory :multiple_diffs do |f|
      f.raw read_diff_file "multi.diff"
    end

    factory :single_diff_but_multiple_chunks do |f|
      f.raw read_diff_file "multi_chunk.diff"
    end

    factory :expired do |f|
      f.raw read_diff_file "simple.diff"
      f.expires_at Time.now - 7.hour
    end

    factory :new_file do |f|
      f.raw read_diff_file "new_file.diff"
    end

    factory :removed_file do |f|
      f.raw read_diff_file "removed_file.diff"
    end

    factory :modified_filename do |f|
      f.raw read_diff_file "modified_filename.diff"
    end

    factory :commit_revision do |f|
      f.raw read_diff_file "commit_revision.diff"
    end

    factory :more_additions do |f|
      f.raw read_diff_file "more_additions.diff"
    end

    factory :more_deletions do |f|
      f.raw read_diff_file "more_deletions.diff"
    end

    factory :git do |f|
      f.raw read_diff_file "git.diff"
    end

    factory :filtered_svn do |f|
      f.raw read_diff_file "filtered.diff"
    end
  end
end

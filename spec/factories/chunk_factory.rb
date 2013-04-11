require 'revue/chunk'
# Duplicated from diff_factory (REFACTOR)
def read_diff_file(filename)
  IO.read(File.expand_path("../diffs/#{filename}", __FILE__))
end

FactoryGirl.define do
  factory :chunk, class: Revue::Chunk do
    initialize_with { new(raw) }

    factory :simple_chunk do |f|
      f.raw read_diff_file("simple.chunk")
    end

    factory :mid_file_chunk do |f|
      f.raw read_diff_file("mid_file.chunk")
    end
  end
end
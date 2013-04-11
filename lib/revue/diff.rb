require 'revue/chunk'
module Revue
  class Diff
    FILE_PATTERN = /(?:[ab]{1}\/)?(.*?)(?:(?:\t'{2}?(.*)'{2}?)|$)/
    ORIGINAL_FILENAME_PATTERN = /^--- #{FILE_PATTERN}/
    MODIFIED_FILENAME_PATTERN = /^\+\+\+ #{FILE_PATTERN}/
    CHUNK_PATTERN = /^(@@.*?)(?=\n@@|\Z)/mi

    attr_accessor :raw
    attr_reader :original_filename, :modified_filename, :original_revision,
                :modified_revision, :chunks

    def initialize(raw)
      @raw = raw
      parse
    end

    def original_filename
      @original_filename == "/dev/null" ? @modified_filename : @original_filename
    end

    def number_of_added_lines
      @number_of_added_lines ||= @raw.scan(Revue::Chunk::ADDED_PATTERN).size
    end

    def number_of_deleted_lines
      @number_of_deleted_lines ||= @raw.scan(Revue::Chunk::REMOVED_PATTERN).size
    end

    def number_of_modified_lines
      @number_of_modified_lines ||= number_of_added_lines + number_of_deleted_lines
    end

    def proportion_of_deleted_lines
      return 100 if number_of_added_lines == 0
      ((100.0 * number_of_deleted_lines / number_of_modified_lines)).round
    end

  private

    def parse
      @raw.match(ORIGINAL_FILENAME_PATTERN)
      @original_filename, @original_revision = $1, $2
      @raw.match(MODIFIED_FILENAME_PATTERN)
      @modified_filename, @modified_revision = $1, $2
      @chunks = @raw.scan(CHUNK_PATTERN).map { |c| Revue::Chunk.new(c[0]) }
    end
  end
end
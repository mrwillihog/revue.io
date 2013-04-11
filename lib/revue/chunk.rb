require 'revue/line'

module Revue
  class Chunk
    ADDED_PATTERN =     /^\+(?!\+\+\s).*?$/
    REMOVED_PATTERN =   /^-(?!--\s).*?$/
    UNCHANGED_PATTERN = /^ (.*)$/
    NO_NEW_LINE_PATTERN = /^\\ No newline at end of file$/
    CHUNK_HEADER_PATTERN = /^@@\s+-(\d+)(?:,\d+)?\s+\+(\d+)(?:,\d+)?\s+@@/

    attr_reader :raw, :lines, :header, :original_line_number, :modified_line_number

    def initialize(raw)
      @raw = raw
      parse
    end

  private

    def parse
      @lines = []
      @raw.match CHUNK_HEADER_PATTERN
      original_starting_number = @original_line_number = $1.to_i
      modified_starting_number = @modified_line_number = $2.to_i

      @raw.each_line do |line|
        case line
        when Revue::Diff::CHUNK_PATTERN
          @header = line.squish
        when ADDED_PATTERN
          @lines << Revue::Line.new(line, modified: modified_starting_number)
          modified_starting_number += 1
        when REMOVED_PATTERN
          @lines << Revue::Line.new(line, original: original_starting_number)
          original_starting_number += 1
        when UNCHANGED_PATTERN
          @lines << Revue::Line.new(line, original: original_starting_number,
                                    modified: modified_starting_number)
          original_starting_number += 1
          modified_starting_number += 1
        when NO_NEW_LINE_PATTERN
          @lines << Revue::Line.new(line, original: nil, modified: nil)
        end
      end
    end
  end
end
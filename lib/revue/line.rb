module Revue
  class Line
    attr_reader :raw, :line_numbers, :original_line_number, :modified_line_number

    def initialize(raw, line_numbers = {})
      raise if line_numbers.empty?
      @raw = raw.gsub(/\n$/, '')
      @original_line_number = line_numbers[:original]
      @modified_line_number = line_numbers[:modified]
    end

    def addition?
      @addition ||= @raw =~ Revue::Chunk::ADDED_PATTERN
    end

    def deletion?
      @deletion ||= @raw =~ Revue::Chunk::REMOVED_PATTERN
    end

    def ==(obj)
      obj.raw == @raw
    end

    def to_s
      @raw.inspect
    end
  end
end
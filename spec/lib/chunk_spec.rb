require 'spec_helper'

describe Revue::Chunk do
  it "expects a string in the constructor" do
    expect {
      chunk = Revue::Chunk.new
    }.to raise_error
  end

  describe "#lines" do
    let(:chunk) { FactoryGirl.build :simple_chunk }
    it "includes all additions" do
      chunk.lines.should include(Revue::Line.new("+Line 4", modified: 8), Revue::Line.new("+Line 5", modified: 9))
    end
    it "includes all deletions" do
      chunk.lines.should include(Revue::Line.new("-Line 5", original: 4), Revue::Line.new("-Line 6", original: 5), Revue::Line.new("-Line 7", original: 6))
    end
    it "includes all unchanged lines" do
      chunk.lines.should include(Revue::Line.new(" Line 1", original: 1, modified: 1), Revue::Line.new(" Line 2", original: 2, modified: 2), Revue::Line.new(" Line 3", original: 3, modified: 3))
    end
    context "a chunk not starting at line 1" do
      let(:chunk) { FactoryGirl.build :mid_file_chunk }
      it "assigns the correct line number" do
        chunk.lines[0].original_line_number.should == 21
      end
      it "assigns the correct line number after a deletion" do
        chunk.lines[9].original_line_number.should be_nil
        chunk.lines[9].modified_line_number.should == 24
        chunk.lines[10].original_line_number.should == 30
        chunk.lines[10].modified_line_number.should == 25
      end
    end
  end

  describe "#header" do
    it "returns the header string" do
      chunk = FactoryGirl.build :simple_chunk
      chunk.header.should == "@@ -1,6 +1,5 @@"
    end
  end
end
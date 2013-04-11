require 'spec_helper'

describe Revue::Line do
  describe "intialize" do
    it "requires a line number" do
      expect {
        Revue::Line.new("No line number")
      }.to raise_error
    end
  end
  describe "#addition?" do
    it "returns true when the line begins with a '+'" do
      line = FactoryGirl.build :additional_line
      line.should be_an_addition
    end
    it "returns true if an empty line begins with a '+'" do
      line = FactoryGirl.build :additional_empty_line
      line.should be_an_addition
    end
    it "returns false when the line begins with a '-'" do
      line = FactoryGirl.build :deleted_line
      line.should_not be_an_addition
    end
    it "returns false when the line begins with ' '" do
      line = FactoryGirl.build :unchanged_line
      line.should_not be_an_addition
    end
    it "returns true when the line contains additional '+' characters" do
      line = Revue::Line.new "+ a new line containing +++", modified: 1
      line.should be_an_addition
    end
  end

  describe "#deletion?" do
    it "returns false when the line begins with a '+'" do
      line = FactoryGirl.build :additional_line
      line.should_not be_a_deletion
    end
    it "returns true when the line begins with a '-'" do
      line = FactoryGirl.build :deleted_line
      line.should be_a_deletion
    end
    it "returns true when an empty line begins with a '-'" do
      line = FactoryGirl.build :deleted_empty_line
      line.should be_a_deletion
    end
    it "returns false when the line begins with a ' '" do
      line = FactoryGirl.build :unchanged_line
      line.should_not be_a_deletion
    end
    it "returns true when the line contains additional '-' characters" do
      line = Revue::Line.new "- a deleted line that contained ---", original: 1
      line.should be_a_deletion
    end
  end

  describe "#original_line_number" do
    it "returns nil on an additiona line" do
      line = FactoryGirl.build :additional_line
      line.original_line_number.should be_nil
    end
    it "returns the correct line number for a deleted line" do
      line = FactoryGirl.build :deleted_line
      line.original_line_number.should == 2
    end
    it "returns the correct line number for an unchanged line" do
      line = FactoryGirl.build :unchanged_line
      line.original_line_number.should == 3
    end
    it "returns nil on a 'no new line' message" do
      line = FactoryGirl.build :no_new_line
      line.original_line_number.should be_nil
    end
  end

  describe "#modified_line_number" do
    it "returns the correct line number for an additional line" do
      line = FactoryGirl.build :additional_line
      line.modified_line_number.should == 1
    end
    it "returns nil for a deleted line" do
      line = FactoryGirl.build :deleted_line
      line.modified_line_number.should be_nil
    end
    it "return the correct line number for an unchanged line" do
      line = FactoryGirl.build :unchanged_line
      line.modified_line_number.should == 3
    end
    it "returns nil on a 'no new line' message" do
      line = FactoryGirl.build :no_new_line
      line.original_line_number.should be_nil
    end
  end

  describe "==" do
    it "returns true when 2 lines have the same content" do
      line1 = FactoryGirl.build :additional_line
      line2 = FactoryGirl.build :additional_line
      line1.should == line2
    end
    it "returns false when 2 lines have different content" do
      line1 = FactoryGirl.build :additional_line
      line2 = FactoryGirl.build :deleted_line
      line1.should_not == line2
    end
  end
end
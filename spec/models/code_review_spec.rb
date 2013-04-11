require 'spec_helper'

describe CodeReview do

  describe "#diffs" do
    context "A code review with a single diff" do
      let(:review) { FactoryGirl.build :simple }

      it "returns a single diff" do
        review.diffs.length.should == 1
      end
    end

    context "A code review with multiple diffs" do
      let(:review) { FactoryGirl.build :multiple_diffs }

      it "returns the correct number of diffs" do
        review.diffs.length.should == 3
      end
    end
  end

  describe "#to_param" do
    let(:review) { FactoryGirl.create :simple }
    it "does not return the id" do
      review.to_param.should_not == review.id.to_s
    end
    it "returns the token" do
      review.to_param.should == review.token
    end
  end

  describe ".from_param" do
    let(:review) { FactoryGirl.create :simple }
    it "finds a code review from its token" do
      CodeReview.from_param(review.token).should == review
    end
  end

  describe "#token" do
    let(:review) { FactoryGirl.create :simple }
    it "is 22 characters long" do
      review.token.length.should == 22
    end
    it "is unique" do
      new_review = FactoryGirl.create :simple
      new_review.token.should_not == review.token
    end
  end
end

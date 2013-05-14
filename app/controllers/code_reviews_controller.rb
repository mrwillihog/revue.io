class CodeReviewsController < ApplicationController
  def index
    @review = CodeReview.new
    @example = load_example
  end
  def show
    @review = CodeReview.not_expired.find_by_token(params[:id])
    sleep 0.5 and raise ActiveRecord::RecordNotFound if @review.nil?
    respond_to do |format|
      format.html
      format.diff { render text: @review.raw }
      format.patch {
        #Headers instruct browser to download and not view
        response.headers['Content-Disposition'] = "attachment; filename=\"revue-#{@review.token}.patch\""
        response.headers['Content-Type'] = 'application/force-download"'
        response.headers['Content-Transfer-Encoding'] = 'binary'
        render text: @review.raw
      }
    end
  end
  def create
    @review = CodeReview.new(params[:code_review])
    if @review.save
      redirect_to code_review_path(@review)
    else
      @example = load_example
      flash[:error] = "Whoops! That appears to be an invalid diff."
      redirect_to code_reviews_path
    end
  end

private

  def load_example
    CodeReview.new raw: IO.read(File.expand_path("../../views/code_reviews/example.diff", __FILE__))
  end
end
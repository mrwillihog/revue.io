module Api
  module V1
    class CodeReviewsController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :json

      def create
        @review = CodeReview.new raw: params[:content]
        if @review.save
          render :json => { url: code_review_url(@review), expires_at: @review.expires_at }
        else
          render :json => { errors: @review.errors.full_messages }, status: 422
        end
      end

      def show
        @review = CodeReview.not_expired.find_by_token! params[:id]
        sleep 0.5 and raise ActiveRecord::RecordNotFound if @review.nil?
        if params[:callback]
          format.js { render :json => {:content => @review.raw}, :callback => params[:callback] }
        else
          format.json { render json: {:content => @review.raw}}
        end
      end
    end
  end
end

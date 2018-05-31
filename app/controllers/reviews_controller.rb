class ReviewsController < ApplicationController
  def create
    if @review.save
      respond_to do |format|
        format.html { redirect_to reports_path(@user) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'reports/show' }
        format.js
      end
    end
  end
end

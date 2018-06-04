class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:departing_city, :arrival_city, :date])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.save
    redirect_to dashboard_path
  end


  private

  def request_params
    params.require(:request).permit(params[:departing_city, :arrival_city, :date])
  end
end

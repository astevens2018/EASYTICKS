class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.save
    redirect_to dashboard_path
  end


  private

  def request_params
    params.require(:request).permit(:preference)
  end
end

class TicketsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @tickets= Ticket.all
    @users = User.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    redirect_to tickets_path(@ticket.id)
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

   def update
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.update(ticket_params)
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end

  def confirmation
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :date, :time, :departing_city, :arrival_city, :price, :booking_reference)
  end

end



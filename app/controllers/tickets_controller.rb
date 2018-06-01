class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
     # if !params[:departing_city] && !params[:arrival_city] && !params[:date]
      # redirect_to new_requests_path
    # end

    @tickets= Ticket.all
    @tickets = Ticket.joins(:departing_city).joins(:arrival_city).joins(:date) if params[:ticket]
    @tickets = Ticket.where("tickets.departing_city = ?", params[:departing_city]) if params[:departing_city].present?
    @tickets = Ticket.where("arrival_city = ?", params[:arrival_city]) if params[:arrival_city].present?
    @tickets = Ticket.where("date = ?", params[:date]) if params[:date].present?

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
    @ticket.seller = current_user
    @ticket.save
    redirect_to tickets_path(@ticket.id)
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.buyer = current_user_buyer
    @ticket.seller = current_user_seller
    @ticket.save
    redirect_to new_ticket_payment_path(@ticket)

  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end

  def confirmation
    @ticket = Ticket.find(params[:id])
    require 'scrapifier'
    # bookingreference = @ticket.booking_reference
    # lastname = @ticket.name_on_ticket
    # url = "https://managebooking.eurostar.com/uk-en/dashboard?pnr=#{bookingreference}&surname=#{lastname}"
    url = "https://tickets.eurostar.com/tickets/SQMBOF/7133c742-06b1-40c4-8d64-b8f34b6dba20.pdf?response-content-type=application%2Fpdf&AWSAccessKeyId=AKIAIS4OAMU4IZGEPEAQ&Expires=1531849140&Signature=K%2FYJ%2FaE6jzBx3eKAy5a6Bvt5ycM%3D"
    @ticket_info = url.scrapify
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :date, :time, :departing_city, :arrival_city, :price, :booking_reference)
  end

end



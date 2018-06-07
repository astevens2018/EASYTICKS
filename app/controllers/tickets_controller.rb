require 'timeout'

class TicketsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
     # if !params[:departing_city] && !params[:arrival_city] && !params[:date]
      # redirect_to new_requests_path
    # end

    @tickets = Ticket.all.order(date: :asc, time: :asc)
    if params[:ticket]
      @tickets = @tickets.where(departing_city: params[:departing_city], arrival_city: params[:arrival_city], date: params[:date]).order(date: :asc, time: :asc)
    end
    @users = User.all

  end

  def show
    @ticket = Ticket.find(params[:id])
    @seller_tickets_count = Ticket.where(seller_id: @ticket.seller.id).count
  end

  def counter
    @ticket_seller = ticket.seller_id
    counter = 0
    @ticket.seller_id.tickets.each do |ticket|
      counter = counter + 1
    end
    return counter
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.seller = current_user
    if @ticket.save
      redirect_to dashboard_path(:anchor => "#selling")
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.buyer = current_user_buyer
    @ticket.seller = current_user_seller
    @ticket.save
    redirect_to ticket_confirmation_path(@ticket)

  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to dashboard_path(:anchor => "#selling")
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
    params.require(:ticket).permit(:user_id, :date, :time, :departing_city, :arrival_city, :price, :booking_reference, :name_on_ticket)
  end

end



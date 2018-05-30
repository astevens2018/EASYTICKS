class PaymentsController < ApplicationController
  before_action :set_ticket

  def new
  end

  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @ticket.amount_cents,
    description:  "Payment for ticket #{@ticket.id}",
    currency:     @ticket.amount.currency
  )

  @ticket.update(payment: charge.to_json, state: 'paid')
  redirect_to dashboard_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_ticket_payment_path(@ticket)
  end

private

  def set_ticket
    @ticket = params[:ticket_id]
  end
end
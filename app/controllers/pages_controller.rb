class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @tickets = Ticket.all
  end
end

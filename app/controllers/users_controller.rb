class UsersController < ApplicationController

  def home
  end

  def dashboard
    @tickets = Ticket.all
  end

end

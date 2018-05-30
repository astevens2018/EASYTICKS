class UsersController < ApplicationController

  def home
  end

  def dashboard
    @tickets = Ticket.all

    @currentUser = current_user.id

    if  current_user.facebook_picture_url
      @avatar_url = current_user.facebook_picture_url
    elsif @current_user.photo
      @avatar_url = @current_user.photo
    else
       @avatar_url = 'http://placehold.it/70x70'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end



  private
    def user_params
      params.require(:user).permit(:email, :bankaccount, :phone, :identitycard, :first_name, :last_name, :photo)
    end
end

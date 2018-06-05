class UsersController < ApplicationController

  def home
  end

  def all
    @users = User.all
  end

  def dashboard
    @tickets = Ticket.all
    @requests = current_user.requests
    @currentUser = current_user.id
  end

def index

  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to dashboard_path
  end

  def update_form
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def phone_validation
    # Create user on Authy, will return an id on the object
  end

  def create_validation
    @user = User.find(params[:user][:id])
    @user.update(user_params)
    redirect_to show_verify_path

  end

  def show_verify
    # also update user info i get from the form

    authy = Authy::API.register_user(
      email: current_user.email,
      cellphone: current_user.phone,
      country_code: current_user.country_code
    )
    current_user.update(authy_id: authy['id'])
    Authy::API.request_sms(id: current_user.authy_id)
  end

  def verify
    @user = current_user

    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])


    if token.ok?
      # Mark the user as verified for get /user/:id
      @user.update(verified: true)

      # Send an SMS to the user 'success'
      send_message("You did it! Signup complete :)")

      # Show the user profile
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end



  def send_message(message)
    twilio_number = ENV['TWILIO_NUMBER']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']

    @client.api.accounts(account_sid).messages.create(
      from: twilio_number,
      to: '+' + current_user.country_code + current_user.phone,
      body: message
    )
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = 'Verification code re-sent'
    redirect_to show_verify_path
  end



  private
    def user_params
      params.require(:user).permit(:email, :bankaccount, :phone, :identitycard, :first_name, :last_name, :photo, :country_code)
    end
end

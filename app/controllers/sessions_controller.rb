class SessionsController < ApplicationController
   before_action :logged_in?, only: :new
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user
      flash.now[:success] = "Welcome"
      sign_in user
      redirect_to user_path(current_user.id)
  	else
  		flash.now[:success] = "Invalid email or password"
      render "new"
  	end
  end

  def delete
    sign_out
  end

  def logged_in?
    if user_signed_in?
      redirect_to users_path
    end
  end
end

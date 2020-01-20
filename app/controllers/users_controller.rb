class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to @user
      flash[:success] = 'User created'
    else
      render 'new'
    end
  end

  def show
    if current_user.events.any?
      @events = current_user.events
    else
      @events = []
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

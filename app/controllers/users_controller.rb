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
    @upcoming = Event.upcoming.joins(:event_attendances).where(event_attendances: { attendee_id: current_user.id })
    @previous = Event.previous.joins(:event_attendances).where(event_attendances: { attendee_id: current_user.id })
  end

  def hosting
    @events = current_user.events if current_user.events.any?
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

class InvitationsController < ApplicationController
  def new
    @invitation = current_user.invitations.new
  end

  def create
    @invitation = current_user.invitations.new(user_params)
    if @invitation.save
      flash[:success] = 'Invitation created'
      render 'new'
    else
      flash[:alert] = 'Couldn\'t create invitation'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:invitation).permit(:user_id, :event_id)
  end
end

class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    
    if @invitation.save
      flash[:success] = 'Invitation created'
      render 'new'
    else
      flash[:alert] = 'Couldn\'t create invitation'
      render 'new'
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :event_id, :creator_id)
  end
end

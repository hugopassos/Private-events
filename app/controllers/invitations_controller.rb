class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.where(user_id: current_user.id, accepted: false)
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      flash[:success] = 'Invitation created'
      render 'new'
    else
      @invitation.valid?
      render 'new'
      flash[:alert] = 'Couldn\'t create invitation'
    end
  end

  def accept
    @invitation = Invitation.find_by(id: params[:id])
    @invitation.accept
    flash[:success] = 'You accepted the invitation!'
    redirect_to invitations_path
  end

  def destroy
    @invitation = Invitation.find_by(id: params[:id]).destroy
    redirect_to invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id, :event_id, :creator_id)
  end
end

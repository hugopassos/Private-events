class EventsController < ApplicationController
  def index
  end

  def new
  	@event = current_user.events.build
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		redirect_to @event
  		flash[:success] = "Your event was created"
  	else
  		render "new"
  	end
  end

  def show
  end

  private
  	def event_params
  		params.require(:event).permit(:title, :description, :date)
  	end

end

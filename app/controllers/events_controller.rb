class EventsController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
    @previous_events = Event.previous
  end

  def new
  	@event = current_user.events.build
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "Your event was created"
      redirect_to @event
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

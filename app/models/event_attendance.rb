class EventAttendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  def attend_event(user, event)
    @event = Event.find_by(id: event)
    @user = User.find_by(id: user)
    @event.attendees << @user
  end
end

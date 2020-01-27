require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
   it 'belongs to attendee' do
		event_attendance = EventAttendance.reflect_on_association(:attendee)
		expect(event_attendance.macro).to eq(:belongs_to)
	end
	
	it 'belongs to attended event' do
		event_attendance = EventAttendance.reflect_on_association(:attended_event)
		expect(event_attendance.macro).to eq(:belongs_to)
	end
end

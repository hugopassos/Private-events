class AddIndexesToEventAttendances < ActiveRecord::Migration[5.2]
  def change
    add_index :event_attendances, :attended_event_id
    add_index :event_attendances, :attendee_id
  end
end

class Invitation < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :user
  belongs_to :event
  validates :user_id, uniqueness: { scope: :event_id,
                                    message: 'Can\'t send the same invitation twice' }

  def accept
    self.update_attributes(accepted: true)
    @event = EventAttendance.new
    @event.attend_event(self.user_id, self.event_id)
  end
end

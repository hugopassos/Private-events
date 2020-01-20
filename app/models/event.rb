class Event < ApplicationRecord
	belongs_to :creator, class_name: 'User'
  scope :upcoming, -> { where('date >= ?', Date.today).order('date asc') }
  has_many :event_attendance, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendance, source: :attendee
end

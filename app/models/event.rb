class Event < ApplicationRecord
	validates :title, presence: true, length: { minimum: 3 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :date, presence: true

	belongs_to :creator, class_name: 'User'
	scope :upcoming, -> { where('date >= ?', Date.today).order('date asc') }
	scope :previous, -> { where('date < ?', Date.today).order('date desc') }
	has_many :event_attendances, foreign_key: :attended_event_id
	has_many :attendees, through: :event_attendances, source: :attendee
	has_many :invitations, foreign_key: :event_id, dependent: :destroy
end

class Invitation < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :user
  belongs_to :event
  validates :user_id, uniqueness: { scope: :event_id,
                                    message: 'Can\'t send the same invitation twice' }
end

class Invitation < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :user
  belongs_to :event
end

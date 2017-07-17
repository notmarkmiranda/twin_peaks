class Study < ApplicationRecord
# status enum - pending, enrolling, active, follow up, closed
  validates_presence_of :type
  validates_presence_of :name
  validates_presence_of :status
  validates :protocol_number, presence: true, uniqueness: true
  validates_presence_of :creator_id

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  enum status: %i(pending enrolling active follow_up closed)
end

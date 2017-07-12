# :nodoc:
class User < ApplicationRecord
  has_secure_password
  validates :user_id, presence: true, uniqueness: true
  acts_as_user roles: %i[patient nurse provider super_admin]
end

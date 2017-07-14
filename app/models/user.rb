# :nodoc:
class User < ApplicationRecord
  has_secure_password
  validates :user_id, presence: true, uniqueness: true

  has_many :user_roles
  has_many :roles, through: :user_roles
end

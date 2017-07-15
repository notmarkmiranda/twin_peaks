# :nodoc:
class User < ApplicationRecord
  has_secure_password
  validates :login, presence: true, uniqueness: true

  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    roles.pluck(:title).any? do |title|
      title.downcase == 'admin'
    end
  end
end

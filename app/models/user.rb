# :nodoc:
require 'role_model'

class User < ApplicationRecord
  has_secure_password
  include RoleModel

  roles :admin, :pi, :coordinator

  validates :login, presence: true, uniqueness: true

  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    roles.pluck(:title).any? do |title|
      title.downcase == 'admin'
    end
  end
end

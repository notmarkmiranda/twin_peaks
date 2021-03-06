# :nodoc:
require 'role_model'

class User < ApplicationRecord
  has_secure_password
  include RoleModel
  has_many :studies, class_name: 'Study', foreign_key: 'creator_id'

  ROLES = %i(admin primary_investigator coordinator).freeze
  roles ROLES

  validates :login, presence: true, uniqueness: true

  def activate
    return if active
    update(active: true)
  end

  def active_status
    active ? 'Active' : 'Inactive'
  end

  def deactivate
    return if !active
    update(active: false)
  end
end

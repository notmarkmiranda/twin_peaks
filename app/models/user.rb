# :nodoc:
require 'role_model'

class User < ApplicationRecord
  has_secure_password
  include RoleModel

  ROLES = %i(admin primary_investigator coordinator).freeze
  roles ROLES

  validates :login, presence: true, uniqueness: true

end

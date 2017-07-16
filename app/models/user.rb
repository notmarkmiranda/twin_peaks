# :nodoc:
require 'role_model'

class User < ApplicationRecord
  has_secure_password
  include RoleModel

  roles :admin, :primary_investigator, :coordinator

  validates :login, presence: true, uniqueness: true

end

# :nodoc:
require 'role_model'

class User < ApplicationRecord
  has_secure_password
  include RoleModel

  roles %i(admin primary_investigator coordinator).freeze

  validates :login, presence: true, uniqueness: true

end

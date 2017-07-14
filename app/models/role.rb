class Role < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :user_roles
  has_many :users, through: :user_roles
end

class Role < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end

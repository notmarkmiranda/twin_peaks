require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_uniqueness_of :user_id }
  end

  context 'relationships' do
    it { should have_many :user_roles }
    it { should have_many(:roles).through(:user_roles) }
  end
end

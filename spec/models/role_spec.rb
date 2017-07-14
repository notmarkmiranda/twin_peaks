require 'rails_helper'

RSpec.describe Role, type: :model do
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
  end

  context 'relationships' do
    it { should have_many :user_roles }
    it { should have_many(:users).through(:user_roles) }
  end
end

require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it { should validate_presence_of :login }
    it { should validate_uniqueness_of :login }
  end

  context 'relationships' do
    it { should have_many :user_roles }
    it { should have_many(:roles).through(:user_roles) }
  end

  context 'methods' do
    before do
      @user = create(:user)
    end

    it '#admin? - true' do
      admin = create(:role, title: 'Admin')
      @user.roles << admin
      expect(@user.admin?).to be true
    end

    it '#admin? - false' do
      coordinator = create(:role, title: 'Coordinator')
      @user.roles << coordinator
      expect(@user.admin?).to be false
    end
  end
end

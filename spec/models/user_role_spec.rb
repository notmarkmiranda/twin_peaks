require 'rails_helper'

RSpec.describe UserRole, type: :model do
  context "validations" do
    before { create(:user_role) }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :role_id }
    it { should validate_uniqueness_of(:user_id).scoped_to(:role_id) }
  end

  context 'relationships' do
    it { should belong_to :user }
    it { should belong_to :role }
  end
end

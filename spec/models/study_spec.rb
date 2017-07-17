require 'rails_helper'

RSpec.describe Study, type: :model do
  context "validations" do
    it { should validate_presence_of :type }
    it { should validate_presence_of :name }
    it { should validate_presence_of :status }
    it { should validate_presence_of :protocol_number }
    it { should validate_uniqueness_of :protocol_number }
    it { should validate_presence_of :creator_id }
  end

  context 'relationships' do
    it { should belong_to :creator }
  end
end

require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it { should validate_presence_of :login }
    it { should validate_uniqueness_of :login }
  end
end

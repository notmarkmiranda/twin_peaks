require 'rails_helper'

RSpec.describe Users::ActivateController, type: :controller do
  before { @user = create(:user, active: false) }

  it 'PATCH#update' do
    expect {
      patch :update, params: { user_id: @user.id }
    }.to change{ @user.reload.active }
    expect(response).to redirect_to @user
  end
end

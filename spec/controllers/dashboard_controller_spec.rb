require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context "as a user" do
    before do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template :show
    end
  end

  context 'as a visitor, not logged in' do
    it "redirects to not_found" do
      get :show
      expect(response).to redirect_to not_found_path
    end
  end
end

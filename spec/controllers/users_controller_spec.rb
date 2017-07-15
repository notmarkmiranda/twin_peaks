require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "admin can trigger actions" do
    before do
     role = create(:role, title: "Admin")
     ur = create(:user_role, role: role)
     admin = ur.user
     allow_any_instance_of(ApplicationController).to receive(:current_user)
       .and_return(admin)
    end

    it 'GET#new' do
      get :new
      expect(assigns[:user]).to be_a_new(User)
      expect(response).to render_template :new
    end

    it 'POST#create - happy template' do
      attrs = attributes_for(:user)
      post :create, params: { user: attrs }
      expect(response).to redirect_to user_path(User.last)
    end

    it 'POST#create - sad template' do
      post :create, params: { user: { password: 'password' } }
      expect(response).to render_template :new
    end
  end

  context "non-admin gets redirect" do
    before do
      role = create(:role, title: "Coordinator")
      ur = create(:user_role, role: role)
      coordinator = ur.user
      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(coordinator)
    end

    it 'GET#new - happy template' do
      get :new
      expect(response).to redirect_to not_found_path
    end

    it 'POST#create - happy template' do
      attrs = attributes_for(:user)
      post :create, params: { user: attrs }
      expect(response).to redirect_to not_found_path
    end
  end
end

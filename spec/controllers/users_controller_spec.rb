require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "admin can trigger actions" do
    before do
      admin = create(:admin)
     allow_any_instance_of(ApplicationController).to receive(:current_user)
       .and_return(admin)
    end

    it 'GET#new' do
      get :new
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

    it 'GET#edit' do
      user = create(:user)
      get :edit, params: { id: user.id }
      expect(response).to render_template :edit
    end

    it 'PATCH#update - happy template' do
      user = create(:user)
      patch :update, params: { id: user.id, user: { login: 'asdf', password: 'asdf' } }
      expect(response).to redirect_to user_path(user)
    end

    it 'PATCH#update - sad template' do
      user = create(:user)
      patch :update, params: { id: user.id, user: { login: '' } }
      expect(response).to render_template :edit
    end
  end

  context "non-admin gets redirect" do
    before do
      coordinator = create(:coordinator)
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

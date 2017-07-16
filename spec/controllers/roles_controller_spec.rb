require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  context "admin can trigger actions" do
    before do
      @role = create(:role, title: "Admin")
      ur = create(:user_role, role: @role)
      admin = ur.user
      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(admin)
    end

    it 'GET#index' do
      get :index
      expect(response).to render_template :index
    end

    it 'GET#show' do
      get :show, params: { id: @role.id }
      expect(response).to render_template :show
    end

    it 'GET#new' do
      get :new
      expect(response).to render_template :new
    end

    it 'POST#create - happy' do
      attrs = attributes_for :role
      expect {
        post :create, params: { role: attrs }
      }.to change(Role, :count)
      expect(response).to redirect_to role_path(Role.last)
    end

    it 'POST#create - sad' do
      expect {
        post :create, params: { role: { title: "" } }
      }.to_not change(Role, :count)
      expect(response).to render_template :new
    end

    # it 'GET#edit' do
      # get :edit
      # expect(response).to render_template :edit
    # end
    it 'PATCH#update'
  end

  context "non-admin will get redirect" do
    before do
      role = create(:role, title: "coordinator")
      ur = create(:user_role, role: role)
      coordinator  = ur.user
      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(coordinator)
    end

    it 'GET#index'
    it 'GET#show'
    it 'GET#new'
    it 'POST#create'
    it 'GET#edit'
    it 'PATCH#update'
  end
end

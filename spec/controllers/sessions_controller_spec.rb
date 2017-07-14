require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "GET#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context "POST#create" do
    before { @user = create(:user) }
    it "with valid username / password, redirection" do
      post :create, params: { login: @user.login, password: 'password' }
      expect(response).to redirect_to dashboard_path
    end

    it "with invalid username" do
      post :create, params: { login: "#{@user.login}a", password: 'password' }
      expect(response).to render_template :new
    end

    it "with invalid password" do
      post :create, params: { login: @user.login, password: 'paszwordz' }
      expect(response).to render_template :new
    end
  end

  context "GET#destroy" do
    it 'log out, redirect' do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end

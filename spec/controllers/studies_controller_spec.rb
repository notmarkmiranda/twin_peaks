require 'rails_helper'

RSpec.describe StudiesController, type: :controller do
  context 'gets' do
    before do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'GET#new' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'post' do
    before do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'POST#create - happy' do
      attrs = attributes_for(:study)
      expect {
        post :create, params: { study: attrs }
      }.to change(Study, :count)
      expect(response).to redirect_to(Study.last)
    end

    it 'POST#create - sad' do
      attrs = attributes_for(:study)
      expect {
        post :create, params: { study: attrs.except(:study_type) }
      }.to_not change(Study, :count)
      expect(response).to render_template :new
    end
  end
end

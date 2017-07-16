require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  context 'GET#index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context 'GET#not_found' do
    it 'renders the not found template' do
      get :not_found
      expect(response).to render_template :not_found
    end
  end
end

require 'rails_helper'

RSpec.describe BookingsController do
  describe 'GET #new' do
    subject { get :new }

    it 'responds with http success' do
      expect(subject).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    subject { get :index }

    it 'redirects' do
      expect(subject).to have_http_status(302)
    end
  end
end

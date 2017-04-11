require 'rails_helper'

RSpec.describe Dashboard::BookingsController, type: :controller do
  describe 'GET #index' do
    login_user

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    login_user

    let!(:booking) { create(:booking, offer_ids: [create(:offer).id]) }

    it 'returns http success' do
      get :show, params: { id: booking.id }

      expect(response).to have_http_status(:success)
    end
  end
end

require 'rails_helper'

RSpec.describe Dashboard::Bookings::WeeksController, type: :controller do
  describe 'GET #show' do
    context 'when user is logged in' do
      login_user

      it 'returns http success' do
        get :show, params: { booking_year: 2017, week_number: 15 }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user NOT is logged in' do
      it 'returns http 302' do
        get :show, params: { booking_year: 2017, week_number: 15 }
        expect(response).to have_http_status(302)
      end
    end
  end
end

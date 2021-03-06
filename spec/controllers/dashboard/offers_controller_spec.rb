require 'rails_helper'

RSpec.describe Dashboard::OffersController, type: :controller do
  describe 'GET #new' do
    context 'when the user is logged in' do
      login_user

      it 'returns http success' do
        get :new
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST #create' do
    context 'when the user is logged in' do
      login_user
      let(:member) { create(:member) }

      it 'returns http 302' do
        post :create, params: { offer: attributes_for(:offer, member_id: member.id) }

        expect(response).to have_http_status(302)
      end
    end

    context 'when name is absent' do
      login_user

      it 'returns http 200' do
        post :create, params: { offer: attributes_for(:offer, name: nil) }

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #edit' do
    context 'when the user is logged in' do
      login_user

      let!(:offer) { create(:offer) }

      it 'returns http success' do
        get :edit, params: { id: offer.id }

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PUT #update' do
    context 'when the user is logged in' do
      login_user

      let!(:offer) { create(:offer) }

      it 'returns http 302' do
        put :update, params: { id: offer.id, offer: { description: 'New' } }

        expect(response).to have_http_status(302)
      end
    end

    context 'when name is absent' do
      login_user

      let!(:offer) { create(:offer) }

      it 'returns http 200' do
        put :update, params: { id: offer.id, offer: attributes_for(:offer, name: nil) }

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #destroy' do
    context 'when the user is logged in' do
      login_user

      let!(:offer) { create(:offer) }

      it 'returns http 302' do
        get :destroy, params: { id: offer.id }

        expect(response).to have_http_status(302)
      end
    end
  end
end

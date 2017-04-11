require 'rails_helper'

RSpec.describe Dashboard::ParagraphsController, type: :controller do
  let!(:paragraph) do
    create(:paragraph)
  end

  describe 'GET #new' do
    context 'when user is loged in' do
      login_user

      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is loged in' do
      login_user

      it 'returns http 302' do
        post :create, params: { paragraph: attributes_for(:paragraph_with_data) }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET #edit' do
    context 'when user is loged in' do
      login_user

      it 'returns http success' do
        get :edit, id: paragraph.id
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT #update' do
    context 'when user is loged in' do
      login_user

      it 'returns http 302' do
        put :update, params: {
          id: paragraph.id, paragraph: attributes_for(:paragraph_with_data)
        }

        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is loged in' do
      login_user

      it 'returns http 302' do
        delete :destroy, id: paragraph.id
        expect(response).to have_http_status(302)
      end
    end
  end
end

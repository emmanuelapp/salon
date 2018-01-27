require 'rails_helper'

RSpec.describe Dashboard::ParagraphsController, type: :controller do
  let!(:paragraph) { create(:paragraph) }

  describe 'GET #new' do
    context 'when user is loged in' do
      login_user

      it 'returns http success' do
        get :new
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is loged in' do
      login_user

      it 'returns http 302' do
        post :create, params: { paragraph: attributes_for(:paragraph) }
        expect(response).to have_http_status(302)
      end
    end

    context 'when user is loged in and title is nil' do
      login_user

      it 'returns http 200' do
        post :create, params: {
          paragraph: attributes_for(:paragraph, title: nil)
        }

        expect(response).to have_http_status(200)
      end
    end

    context 'when user is loged in and body is nil' do
      login_user

      it 'returns http 200' do
        post :create, params: {
          paragraph: attributes_for(:paragraph, body: nil)
        }

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #edit' do
    context 'when user is loged in' do
      login_user

      it 'returns http success' do
        get :edit, params: { id: paragraph.id }
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PUT #update' do
    context 'when user is loged in and valid data is submited' do
      login_user

      it 'returns http 302' do
        put :update, params: {
          id: paragraph.id,
          paragraph: attributes_for(:paragraph)
        }

        expect(response).to have_http_status(302)
      end
    end

    context 'when user is loged in and title is nil' do
      login_user

      it 'returns http 200' do
        put :update, params: {
          id: paragraph.id,
          paragraph: attributes_for(:paragraph, title: nil)
        }

        expect(response).to have_http_status(200)
      end
    end

    context 'when user is loged in and body is nil' do
      login_user

      it 'returns http 200' do
        put :update, params: {
          id: paragraph.id,
          paragraph: attributes_for(:paragraph, body: nil)
        }

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is loged in' do
      login_user

      it 'returns http 302' do
        delete :destroy, params: { id: paragraph.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end

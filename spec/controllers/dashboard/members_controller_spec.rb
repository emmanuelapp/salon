require 'rails_helper'

RSpec.describe Dashboard::MembersController, type: :controller do
  describe "GET #index" do
    subject { get :index }

    context 'when the user is logged in' do
    end

    context 'when the user is not logged in' do
      it 'redirects to login page' do
        expect(subject).to redirect_to 'http://test.host/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe "GET #new" do
    subject { get :new }

    context 'when the user is logged in' do
    end

    context 'when the user is not logged in' do
      it 'redirects to login page' do
        expect(subject).to redirect_to 'http://test.host/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe "GET #edit" do
    subject { get :edit, id: 192 }

    context 'when the user is logged in' do
    end

    context 'when the user is not logged in' do
      it 'redirects to login page' do
        expect(subject).to redirect_to 'http://test.host/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe "POST #create" do
    subject { post :create }

    context 'when the user is logged in' do
    end

    context 'when the user is not logged in' do
      it 'redirects to login page' do
        expect(subject).to redirect_to 'http://test.host/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe "PUT #update" do
    subject { put :update, id: 192 }

    context 'when the user is logged in' do
    end

    context 'when the user is not logged in' do
      it 'redirects to login page' do
        expect(subject).to redirect_to 'http://test.host/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end
end

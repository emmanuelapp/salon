require 'rails_helper'

RSpec.describe Dashboard::MembersController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    context 'when the user is logged in' do
      login_user

      it 'responds with HTTP status 200' do
        expect(subject).to have_http_status 200
      end

      it 'renders the proper template' do
        expect(subject).to render_template(:index)
      end
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

  describe 'GET #new' do
    subject { get :new }

    context 'when the user is logged in' do
      login_user

      it 'responds with HTTP status 200' do
        expect(subject).to have_http_status 200
      end

      it 'renders the proper template' do
        expect(subject).to render_template(:new)
      end
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

  before(:each) do
    @member = Member.create(attributes_for(:member))
  end

  after(:each) { Member.delete_all }

  describe 'GET #edit' do
    subject { get :edit, params: { id: @member.id } }

    context 'when the user is logged in' do
      login_user

      it 'responds with HTTP status 200' do
        expect(subject).to have_http_status 200
      end

      it 'renders the proper template' do
        expect(subject).to render_template(:edit)
      end
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

  describe 'POST #create' do
    subject { post :create }

    context 'when the user is logged in and submmits valid data' do
      # TODO
    end

    context 'when the user is logged in and submits invalid data' do
      # TODO
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

  describe 'PUT #update' do
    subject { put :update, params: { id: @member.id } }

    context 'when the user is logged in and submmits valid data' do
      # TODO
    end

    context 'when the user is logged in and submits invalid data' do
      # TODO
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

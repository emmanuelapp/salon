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
        expect(subject).to redirect_to '/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:member) { create(:member) }

    context 'when user is logged in' do
      login_user

      subject { delete :destroy, params: { id: member.id } }

      it 'decrements the Member rows count by one' do
        expect { subject }.to change { Member.count }.by(-1)
      end

      it 'redirects to dashboard_members_path' do
        expect(subject).to redirect_to dashboard_members_path
      end
    end

    context 'when user is not logged in' do
      subject { delete :destroy, params: { id: member.id } }

      it 'does not change the Member rows count' do
        expect { subject }.to change { Member.count }.by(0)
      end

      it 'redirects to new_user_session_path' do
        expect(subject).to redirect_to new_user_session_path
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
        expect(subject).to redirect_to '/users/sign_in'
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
        expect(subject).to redirect_to '/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe 'POST #create' do
    context 'when the user is logged in and submmits valid data' do
      subject { post :create, params: { member: attributes_for(:member) } }

      login_user

      it 'chenges Member.count' do
        expect { subject }.to change { Member.count }.by(1)
      end

      it 'redirects to /dashboard/members' do
        expect(subject).to redirect_to '/dashboard/members'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end

    context 'when the user is logged in and submits invalid data' do
      subject { post :create, params: { member: attributes_for(:member, first_name: nil) } }

      login_user

      it 'does not change Member.count' do
        expect { subject }.to change { Member.count }.by(0)
      end

      it 'renders new' do
        expect(subject).to render_template :new
      end

      it 'responds with HTTP status 200' do
        expect(subject).to have_http_status 200
      end
    end

    context 'when the user is not logged in' do
      subject { post :create, params: { member: attributes_for(:member) } }

      it 'redirects to login page' do
        expect(subject).to redirect_to '/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end

  describe 'PUT #update' do
    context 'when the user is logged in and submmits valid data' do
      login_user

      subject do
        put :update, params: {
          id: @member.id, member: { profession: 'Barber' }
        }
      end

      it 'chenges @member' do
        expect { subject }.to(change { @member.reload.profession })
      end

      it 'redirects to /dashboard/members' do
        expect(subject).to redirect_to '/dashboard/members'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end

    context 'when first_name is nil' do
      login_user

      subject do
        put :update, params: {
          id: @member.id, member: { profession: 'Barber', first_name: nil }
        }
      end

      it 'renders edit view' do
        expect(subject).to render_template(:edit)
      end
    end

    context 'when the user is not logged in' do
      subject { put :update, params: { id: @member.id } }

      it 'redirects to login page' do
        expect(subject).to redirect_to '/users/sign_in'
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status 302
      end
    end
  end
end

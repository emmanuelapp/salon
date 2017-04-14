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

  describe 'POST #create' do
    shared_examples 'a new template rendering' do
      context 'when user submits invalid due to attribute absence' do
        subject do
          post :create, params: {
            booking: attributes_for(:booking_with_offer_ids).reject { |k, _| k == attribute }
          }
        end

        it 'renders new' do
          expect(subject).to render_template(:new)
        end
      end
    end

    shared_examples 'a new DB row' do
      it 'creates a new booking into the database' do
        expect { subject }.to change { Booking.count }.by(1)
      end
    end

    shared_examples 'a redirection' do
      it 'redirects to new_booking_path' do
        expect(subject).to redirect_to new_booking_path
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status(302)
      end
    end

    subject { post :create, params: { booking: booking } }

    context 'when user submits valid data' do
      let(:booking) { attributes_for(:booking_with_offer_ids) }

      it 'does not render new template as it would on an error' do
        expect(subject).to_not render_template(:new)
      end

      it_behaves_like 'a redirection'
      it_behaves_like 'a new DB row'
    end

    context 'when additional_info param is absent' do
      let(:booking) { attributes_for(:booking_with_offer_ids, additional_info: nil) }

      it_behaves_like 'a redirection'
      it_behaves_like 'a new DB row'
    end

    context 'when user submits invalid due to first_name absence' do
      let(:attribute) { :first_name }
      it_behaves_like 'a new template rendering'
    end

    context 'when user submits invalid due to last_name absence' do
      let(:attribute) { :last_name }
      it_behaves_like 'a new template rendering'
    end

    context 'when user submits invalid due to phone absence' do
      let(:attribute) { :phone }
      it_behaves_like 'a new template rendering'
    end

    context 'when user submits invalid due to reserved_at absence' do
      let(:attribute) { :reserved_at }
      it_behaves_like 'a new template rendering'
    end

    context 'when user submits invalid due to offer_ids absence' do
      let(:attribute) { :offer_ids }
      it_behaves_like 'a new template rendering'
    end
  end
end

require 'rails_helper'

RSpec.describe BookingsController do
  describe 'GET #new' do
    subject { get :new }

    it 'renders new' do
      expect(subject).to render_template(:new)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    context 'when user submits valid data' do
      let(:params) do
        {
          booking: {
            first_name: 'Jack',
            last_name: 'Daniels',
            phone: '00123456789',
            reserved_at: DateTime.now,
            additional_info: 'Lorem Ipsum'
          }
        }
      end

      it 'does not render new template as it would on an error' do
        expect(subject).to_not render_template(:new)
      end

      it 'redirects to new_booking_path' do
        expect(subject).to redirect_to new_booking_path
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status(302)
      end

      it 'creates a new booking into the database' do
        expect { subject }.to change { Booking.count }.by(1)
      end
    end

    context 'when additional_info param is absent' do
      let(:params) do
        {
          booking: {
            first_name: 'Jack',
            last_name: 'Daniels',
            phone: '00123456789',
            reserved_at: DateTime.now
          }
        }
      end

      it 'responds with HTTP status 302' do
        expect(subject).to have_http_status(302)
      end

      it 'creates a new booking into the database' do
        expect { subject }.to change { Booking.count }.by(1)
      end

      it 'redirects to new_booking_path' do
        expect(subject).to redirect_to new_booking_path
      end
    end

    context 'when user submits invalid due to first_name absence' do
      let(:params) do
        {
          booking: {
            last_name: 'Daniels',
            phone: '00123456789',
            reserved_at: DateTime.now,
            additional_info: 'Lorem Ipsum'
          }
        }
      end

      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end

    context 'when user submits invalid due to last_name absence' do
      let(:params) do
        {
          booking: {
            first_name: 'Jack',
            phone: '00123456789',
            reserved_at: DateTime.now,
            additional_info: 'Lorem Ipsum'
          }
        }
      end

      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end

    context 'when user submits invalid due to phone absence' do
      let(:params) do
        {
          booking: {
            first_name: 'Jack',
            last_name: 'Daniels',
            reserved_at: DateTime.now,
            additional_info: 'Lorem Ipsum'
          }
        }
      end

      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end

    context 'when user submits invalid due to reserved_at absence' do
      let(:params) do
        {
          booking: {
            first_name: 'Jack',
            last_name: 'Daniels',
            phone: '00123456789',
            additional_info: 'Lorem Ipsum'
          }
        }
      end

      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end
  end
end

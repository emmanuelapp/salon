require 'rails_helper'

RSpec.describe Api::V1::BookingsController, type: :controller do
  let(:offer) { create(:offer) }

  describe 'POST #create' do
    context 'when user submits valid data' do
      subject do
        post :create, params: { booking: attributes_for(:booking, offer_id: offer.id) }
      end

      it 'responds with HTTP status code 200' do
        expect(subject).to have_http_status(200)
      end

      it 'responds with success JSON message' do
        response_body = { success: 'Reservation saved!' }
        expect(subject.body).to eq(response_body.to_json)
      end

      it 'changes Booking.count by 1' do
        expect { subject }.to change { Booking.count }.by(1)
      end
    end

    context 'when reserved_at is nil' do
      subject do
        post :create, params: {
          booking: attributes_for(:booking, reserved_at: nil)
        }
      end

      it 'responds with HTTP status code 422' do
        expect(subject).to have_http_status(422)
      end

      it 'changes Booking.count by 0' do
        expect { subject }.to change { Booking.count }.by(0)
      end
    end
  end
end

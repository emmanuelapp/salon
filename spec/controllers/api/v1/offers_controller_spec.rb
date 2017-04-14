require 'rails_helper'

RSpec.describe Api::V1::OffersController, type: :controller do
  describe 'GET #index' do
    context 'when user requests offers' do
      subject { get :index }

      it 'responds with HTTP status 200' do
        expect(subject).to have_http_status(200)
      end

      it 'responds with JSON' do
        expect(subject.header['Content-Type']).to include('application/json')
      end
    end
  end
end

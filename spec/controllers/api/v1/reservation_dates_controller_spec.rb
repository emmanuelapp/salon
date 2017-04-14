require 'rails_helper'

RSpec.describe Api::V1::ReservationDatesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it 'returns HTTP status 200' do
      expect(subject).to have_http_status(200)
    end

    it 'responds with JSON' do
      content_type = 'application/json; charset=utf-8'
      expect(subject.header['Content-Type']).to eq content_type
    end

    it 'has available attribute' do
      expect(JSON(subject.body)).to have_key('available')
    end

    it 'holds an arrays of dates' do
      expect(JSON(subject.body)['available']).to be_an_instance_of(Array)
    end
  end
end

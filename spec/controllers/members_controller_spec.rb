require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it 'responds with HTTP status 200' do
      expect(subject).to have_http_status(200)
    end

    it 'renders template index' do
      expect(subject).to render_template(:index)
    end
  end
end

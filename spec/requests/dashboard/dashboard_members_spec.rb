require 'rails_helper'

RSpec.describe "Dashboard::Members", type: :request do
  describe "GET /dashboard_members" do
    it "works! (now write some real specs)" do
      get dashboard_members_path
      expect(response).to have_http_status(200)
    end
  end
end

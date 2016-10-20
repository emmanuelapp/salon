require "rails_helper"

RSpec.describe Dashboard::MembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dashboard/members").to route_to("dashboard/members#index")
    end

    it "routes to #new" do
      expect(:get => "/dashboard/members/new").to route_to("dashboard/members#new")
    end

    it "routes to #show" do
      expect(:get => "/dashboard/members/1").to route_to("dashboard/members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dashboard/members/1/edit").to route_to("dashboard/members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dashboard/members").to route_to("dashboard/members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dashboard/members/1").to route_to("dashboard/members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dashboard/members/1").to route_to("dashboard/members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dashboard/members/1").to route_to("dashboard/members#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe Api::V1::AnchorRequestsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/api/v1/anchor_requests").to route_to("api/v1/anchor_requests#create")
    end
  end
end

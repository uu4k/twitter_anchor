require 'rails_helper'

RSpec.describe "Api::V1::AnchorRequests", type: :request do
  describe "GET /api/v1/anchor_requests" do
    it "works! (now write some real specs)" do
      get api_v1_anchor_requests_path
      expect(response).to have_http_status(200)
    end
  end
end

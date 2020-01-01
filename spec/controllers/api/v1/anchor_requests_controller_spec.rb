require 'rails_helper'

RSpec.describe Api::V1::AnchorRequestsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # AnchorRequest. As you add validations to AnchorRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::AnchorRequestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AnchorRequest" do
        expect {
          post :create, params: {api/v1_anchor_request: valid_attributes}, session: valid_session
        }.to change(AnchorRequest, :count).by(1)
      end

      it "renders a JSON response with the new api/v1_anchor_request" do

        post :create, params: {api/v1_anchor_request: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api/v1_anchor_request_url(AnchorRequest.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new api/v1_anchor_request" do

        post :create, params: {api/v1_anchor_request: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

end

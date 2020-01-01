class Api::V1::AnchorRequestsController < ApplicationController

  # POST /anchor_requests
  # POST /anchor_requests.json
  def create
    @anchor_request = AnchorRequest.new(anchor_request_params)

    if @anchor_request.save
      render :show, status: :created, location: @anchor_request
    else
      render json: @anchor_request.errors, status: :unprocessable_entity
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def anchor_request_params
    params.fetch(:anchor_request, {})
  end
end

class Api::V1::AnchorRequestsController < ApplicationController

  # GET /anchor_requests
  # GET /anchor_requests.json
  def index
    # Account Activity API のCRC対応
    crc_token = params['crc_token']

    if crc_token.present?
      render json: {
        response_token: "sha256=#{generate_crc_response(Rails.application.config.twitter_consumer_secret, crc_token)}"
      }, status: :ok
    else
      render json: {}, status: :ok
    end
  end

  # POST /anchor_requests
  # POST /anchor_requests.json
  def create
    Rails.logger.debug(params)

    if params[:tweet_create_events].present?
      # {
      #	"for_user_id": "2244994945",
      #	"user_has_blocked": "false",
      #	"tweet_create_events": [
      #	  {
      #		<Tweet Object>
      #	  }
      #	]
      #}
      @anchor_request = AnchorRequest.new(anchor_request_params)

      if @anchor_request.save
        render :show, status: :created, location: @anchor_request
      else
        render json: @anchor_request.errors, status: :unprocessable_entity
      end
    else
      render json: {}, status: :ok
    end
  end

  private

  def generate_crc_response(consumer_secret, crc_token)
    hash = OpenSSL::HMAC.digest('sha256', consumer_secret, crc_token)
    Base64.encode64(hash).strip!
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def anchor_request_params
    params.fetch(:anchor_request, {})
  end
end

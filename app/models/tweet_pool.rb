class TweetPool < ApplicationRecord
  belongs_to :anchor_request
  has_many :tweets
end

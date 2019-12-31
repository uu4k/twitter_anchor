class AnchorRequest < ApplicationRecord
  has_many :anchors
  has_one :tweet_pool
end

class CreateTweetPools < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_pools do |t|
      t.references :anchor_requests, foreign_key: true, null: false
      t.timestamps
    end
  end
end

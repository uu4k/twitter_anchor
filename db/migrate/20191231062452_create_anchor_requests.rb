class CreateAnchorRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :anchor_requests do |t|
      t.string :created_user_screen_name
      t.string :event_tweet_id
      t.string :hash_tag
      t.timestamps
    end
  end
end

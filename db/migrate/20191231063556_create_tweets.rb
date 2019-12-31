class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :tweet_pools, foreign_key: true, null: false
      t.timestamps
    end
  end
end

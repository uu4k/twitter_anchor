class CreateAnchors < ActiveRecord::Migration[6.0]
  def change
    create_table :anchors do |t|
      t.integer :position
      t.references :anchor_requests, foreign_key: true, null: false
      t.timestamps
    end
  end
end

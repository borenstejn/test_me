class CreateTrackerEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :tracker_events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :endpoint

      t.timestamps
    end
  end
end

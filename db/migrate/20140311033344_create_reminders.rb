class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.datetime :remind_at, null: false
      t.string :kind, null: false
      t.boolean :notified, null: false, default: false
      t.boolean :scheduled, null: false, default: false
      t.references :schedule, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end

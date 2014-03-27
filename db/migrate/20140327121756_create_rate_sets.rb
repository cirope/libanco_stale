class CreateRateSets < ActiveRecord::Migration
  def change
    create_table :rate_sets do |t|
      t.string :name, null: false
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end

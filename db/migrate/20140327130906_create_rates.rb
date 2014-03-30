class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :payments_count, null: false
      t.decimal :rate, null: false, precision: 15, scale: 5
      t.references :rate_set, null: false, index: true

      t.timestamps
    end
  end
end

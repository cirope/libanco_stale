class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.decimal :value, null: false, precision: 15, scale: 2
      t.date :expire_at, null: false
      t.datetime :paid_at
      t.references :tax_setting, null: false, index: true
      t.references :customer, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :taxes, :paid_at
    add_index :taxes, :expire_at
  end
end

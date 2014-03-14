class CreateTaxSettings < ActiveRecord::Migration
  def change
    create_table :tax_settings do |t|
      t.string :name, null: false
      t.decimal :value, null: false, precision: 15, scale: 2
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :tax_settings, :name
  end
end

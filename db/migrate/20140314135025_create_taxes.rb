class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.decimal :value, null: false, precision: 15, scale: 2
      t.references :tax_setting, null: false, index: true
      t.references :customer, null: false, index: true

      t.timestamps
    end
  end
end

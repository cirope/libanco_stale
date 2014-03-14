class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :name, null: false
      t.decimal :value, null: false, precision: 15, scale: 2
      t.references :payment, null: false, index: true

      t.timestamps
    end
  end
end

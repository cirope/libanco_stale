class CreatePaymentTaxes < ActiveRecord::Migration
  def change
    create_table :payment_taxes do |t|
      t.references :payment, null: false, index: true
      t.references :tax, null: false, index: true

      t.timestamps
    end
  end
end

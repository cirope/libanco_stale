class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.decimal :amount, null: false, precision: 15, scale: 2
      t.decimal :payment, precision: 15, scale: 2
      t.integer :payments_count, null: false
      t.references :customer, null: false, index: true
      t.references :user, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end

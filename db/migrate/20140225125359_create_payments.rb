class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :number, null: false
      t.decimal :payment, null: false, precision: 15, scale: 2
      t.date :expire_at, null: false
      t.datetime :paid_at
      t.references :loan, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :payments, :number
    add_index :payments, :expire_at
    add_index :payments, :paid_at
    add_index :payments, :account_id
  end
end

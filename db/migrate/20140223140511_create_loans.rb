class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.decimal :amount, null: false, precision: 15, scale: 2
      t.integer :payments_count, null: false
      t.date :next_payment_expire_at, null: false
      t.date :expired_at, null: false
      t.references :customer, null: false, index: true
      t.references :user, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :loans, :expired_at
    add_index :loans, :next_payment_expire_at
  end
end

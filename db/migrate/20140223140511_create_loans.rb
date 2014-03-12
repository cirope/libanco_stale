class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :status, null: false, default: 'current'
      t.decimal :amount, null: false, precision: 15, scale: 2
      t.integer :payments_count, null: false
      t.integer :progress, null: false, default: 0
      t.date :next_payment_expire_at
      t.date :expired_at, null: false
      t.date :canceled_at
      t.references :customer, null: false, index: true
      t.references :user, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :loans, :status
    add_index :loans, :progress
    add_index :loans, :expired_at
    add_index :loans, :canceled_at
    add_index :loans, :next_payment_expire_at
  end
end

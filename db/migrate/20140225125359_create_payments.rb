class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :number, null: false
      t.date :expired_at, null: false
      t.datetime :paid_at
      t.references :loan, null: false, index: true

      t.timestamps
    end

    add_index :payments, :number
    add_index :payments, :expired_at
  end
end
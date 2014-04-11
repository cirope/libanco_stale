class AddAccountToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :account, index: true
    add_column :payments, :lock_version, :integer, null: false, default: 0
  end
end

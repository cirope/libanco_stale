class AddColumnsToTaxes < ActiveRecord::Migration
  def change
    add_column :taxes, :paid_at, :datetime
    add_column :taxes, :expire_at, :date, null: false
    add_reference :taxes, :account, null: false, index: true
    add_column :taxes, :lock_version, :integer, null: false, default: 0

    add_index :taxes, :paid_at
    add_index :taxes, :expire_at
  end
end

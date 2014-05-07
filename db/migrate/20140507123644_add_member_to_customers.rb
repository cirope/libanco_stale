class AddMemberToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :member, :boolean, null: false, default: true
    add_index :customers, :member
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :identification, null: false
      t.string :tax_id
      t.string :email
      t.string :address, null: false
      t.references :city, null: false, index: true
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :customers, :name
    add_index :customers, :tax_id
    add_index :customers, :lastname
    add_index :customers, :identification
  end
end

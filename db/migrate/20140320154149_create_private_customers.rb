class CreatePrivateCustomers < ActiveRecord::Migration
  def change
    create_table :private_customers do |t|
      t.references :company, index: true

      t.timestamps
    end
  end
end

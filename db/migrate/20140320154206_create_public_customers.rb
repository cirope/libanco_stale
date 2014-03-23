class CreatePublicCustomers < ActiveRecord::Migration
  def change
    create_table :public_customers do |t|
      t.string :department
      t.string :division

      t.timestamps
    end
  end
end

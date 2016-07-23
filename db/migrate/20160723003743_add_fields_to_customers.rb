class AddFieldsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :marital_status, :string
    add_column :customers, :spouse_name, :string
    add_column :customers, :education_level, :string
    add_column :customers, :birthdate, :date
    add_column :customers, :profession, :string
    add_column :customers, :work_address, :string
    add_column :customers, :monthly_income, :decimal, precision: 10, scale: 2
    add_reference :customers, :nacionality, index: true
  end
end

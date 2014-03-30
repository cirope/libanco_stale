class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.references :organization, null: false, index: true

      t.timestamps
    end

    add_index :departments, :name
  end
end

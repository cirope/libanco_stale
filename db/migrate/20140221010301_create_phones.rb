class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone, null: false
      t.references :customer, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end
  end
end

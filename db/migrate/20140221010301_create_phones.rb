class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone, null: false
      t.references :phonable, polymorphic: true, index: true

      t.timestamps
    end
  end
end

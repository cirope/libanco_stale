class CreateNacionalities < ActiveRecord::Migration
  def change
    create_table :nacionalities do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :nacionalities, :name, unique: true
  end
end

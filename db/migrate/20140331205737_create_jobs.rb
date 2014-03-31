class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :kind, null: false
      t.date :joining_at
      t.references :customer, null: false, index: true
      t.references :place, polymorphic: true, index: true

      t.timestamps
    end

    add_index :jobs, :kind
    add_index :jobs, :joining_at
  end
end

class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references  :item, polymorphic: true, null: false, index: true
      t.references  :account, index: true
      t.string      :event, null: false
      t.integer     :whodunnit
      t.text        :object
      t.datetime    :created_at
    end
  end
end

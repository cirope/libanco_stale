class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :auth_token, null: false
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.references :account, null: false, index: true
      t.integer :lock_version, null: false, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :auth_token, unique: true
    add_index :users, :password_reset_token, unique: true
  end
end

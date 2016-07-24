class AddAccountToModels < ActiveRecord::Migration
  def change
    add_reference :users, :account, index: true
    add_reference :reminders, :account, index: true
  end
end

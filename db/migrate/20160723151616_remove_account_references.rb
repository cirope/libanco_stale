class RemoveAccountReferences < ActiveRecord::Migration
  def change
    remove_reference :customers, :account
    remove_reference :cities, :account
    remove_reference :companies, :account
    remove_reference :loans, :account
    remove_reference :organizations, :account
    remove_reference :payments, :account
    remove_reference :rate_sets, :account
    remove_reference :schedules, :account
    remove_reference :states, :account
    remove_reference :tax_settings, :account
    remove_reference :taxes, :account
    remove_reference :users, :account
  end
end

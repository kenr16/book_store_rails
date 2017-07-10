class SwitchUserAccountId < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :accounts, :users
    remove_column :accounts, :user_id
    add_column :users, :account_id, :integer
    add_foreign_key :users, :accounts
  end
end

class RemoteUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :user_id
  end
end

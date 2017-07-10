class AddUserForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :user_id, :integer
    add_foreign_key :accounts, :users
  end
end

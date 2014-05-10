class AddUserToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer
    add_index :posts, :user_id
  end
end

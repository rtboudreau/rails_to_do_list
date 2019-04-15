class AddUserIdToTodoItems < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_items, :user_id, :integer
  end
end

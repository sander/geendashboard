class AddTaskToWunderlistTaskLists < ActiveRecord::Migration
  def change
    change_table :wunderlist_task_lists do |t|
      t.text :tasks
    end
  end
end

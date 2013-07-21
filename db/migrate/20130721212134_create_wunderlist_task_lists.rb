class CreateWunderlistTaskLists < ActiveRecord::Migration
  def change
    create_table :wunderlist_task_lists do |t|
      t.references :project, index: true
      t.string :wunderlist_id
      t.references :wunderlist_account, index: true

      t.timestamps
    end
  end
end

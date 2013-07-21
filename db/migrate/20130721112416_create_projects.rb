class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :goal
      t.boolean :visible
      t.boolean :active

      t.timestamps
    end
  end
end

class CreateInvolvements < ActiveRecord::Migration
  def change
    create_table :involvements do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end

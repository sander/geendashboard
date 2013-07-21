class CreateWunderlistAccounts < ActiveRecord::Migration
  def change
    create_table :wunderlist_accounts do |t|
      t.references :user, index: true
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end

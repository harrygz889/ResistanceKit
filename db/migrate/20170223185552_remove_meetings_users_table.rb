class RemoveMeetingsUsersTable < ActiveRecord::Migration[5.0]
  def up
    add_column :meetings, :user_id, :integer
  end

  def down
    drop_table :meetings_users
  end
end

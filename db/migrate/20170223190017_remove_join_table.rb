class RemoveJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :meetings_users
  end
end

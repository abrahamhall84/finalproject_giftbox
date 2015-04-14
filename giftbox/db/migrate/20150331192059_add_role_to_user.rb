class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_gifter, :boolean, default: false
  end
end

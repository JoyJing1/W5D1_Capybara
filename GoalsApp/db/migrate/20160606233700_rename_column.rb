class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :goals, :private, :private_goal
  end
end

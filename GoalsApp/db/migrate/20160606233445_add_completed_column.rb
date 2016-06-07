class AddCompletedColumn < ActiveRecord::Migration
  def change
    add_column :goals, :completed, :boolean, null: false, default: false
  end
end

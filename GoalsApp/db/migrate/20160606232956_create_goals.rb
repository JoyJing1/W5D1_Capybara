class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :description
      t.string :title, null: false
      t.integer :author_id, null: false
      t.boolean :private, default: false

      t.timestamps null: false

      t.index :author_id
      t.index [:author_id, :title], unique: true
    end
  end
end

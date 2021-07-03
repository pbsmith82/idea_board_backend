class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.integer :likes
      t.string :description
      t.integer :component_id
      t.timestamps
    end
  end
end

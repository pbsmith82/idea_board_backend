class AddDislikesToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :dislikes, :integer, default: 0
  end
end

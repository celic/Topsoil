class AddBoolPrivateToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :private, :boolean, :default => false
  end
end

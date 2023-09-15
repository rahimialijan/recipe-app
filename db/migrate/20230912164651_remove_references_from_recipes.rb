class RemoveReferencesFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :references, :string
  end
end

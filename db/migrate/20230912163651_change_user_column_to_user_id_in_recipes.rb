class ChangeUserColumnToUserIdInRecipes < ActiveRecord::Migration[7.0]
  def change
      rename_column :recipes, :user, :user_id
      change_column :recipes, :user_id, :bigint, using: 'user_id::bigint', null: false
      add_index :recipes, :user_id, name: 'index_recipes_on_user_id'
  end
end

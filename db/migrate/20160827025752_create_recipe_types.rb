class CreateRecipeTypes < ActiveRecord::Migration
  def change
    create_table :recipe_types do |t|
      t.integer :recipe_id
      t.integer :type_id
    end
  end
end

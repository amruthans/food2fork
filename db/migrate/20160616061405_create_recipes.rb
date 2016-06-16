class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :publisher
      t.string :f2f_url
      t.string :title
      t.string :source_url
      t.integer :recipe_id
      t.string :image_url
      t.float :social_rank
      t.string :publisher_url

      t.timestamps null: false
    end
  end
end

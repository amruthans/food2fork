namespace :dev do
  desc "Fetch Food2Fork recipes"
  task create_recipe: :environment do
  		['butter', 'chicken', 'paneer', 'chocolate', 'mashroom'].each do |category|
  			ap "--------------------CATEGORY - #{category}---------------------------"
  			resp = RestClient.get 'http://food2fork.com/api/search', {:params => {'key' => '52e595d8dff202904dccef8f1f074b85', 'q' => category}}
  			recipes = JSON.parse(resp)
  			recipes["recipes"].each do |recipe|
  				recipe = Recipe.create(
  		      "publisher": recipe["publisher"],
  		      "f2f_url": recipe["f2f_url"],
  		      "title": recipe["title"],
  		      "source_url": recipe["source_url"],
  		      "recipe_id": recipe["recipe_id"],
  		      "image_url": recipe["image_url"],
  		      "social_rank": recipe["social_rank"],
  		      "publisher_url": recipe["publisher_url"])
  				ap recipe
  			end
  		end

  end
end

class Api::V1::RecipesController < ApplicationController

	def index
			recipes = Recipe.all
			# render json: recipes
			# render json: recipes.pluck(:publisher, :f2f_url, :title, :source_url)
			render json: recipes.map{|r| {
				publisher: r.publisher, 
				f2f_url: r.f2f_url, 
				title: r.title, 
				source_url: r.source_url, 
				}
			}
		end

end

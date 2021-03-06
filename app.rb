require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get '/'  do
	erb(:index)
end

get '/recipes' do
	Recipe.all()
	erb(:recipes)
end

post '/recipes/new' do
	@recipe = Recipe.create({ name: params['name'] })
	redirect '/recipes'
end

get '/recipe/:id' do
	@recipe = Recipe.find(params['id'].to_i())
	erb(:recipe)
end

patch '/recipe/:id' do
	@recipe = Recipe.find(params['id'].to_i())
	@recipe.update({name: params['name']})
	erb(:recipe)
end

delete '/recipes/:id' do
	@recipe = Recipe.find(params['id'].to_i())
	@recipe.destroy()
	redirect '/recipes'
end

post '/recipe/:id' do
	@recipe = Recipe.find(params['id'].to_i())
	@ingredient = Ingredient.find_or_create_by({ name: params['ingredient']})
	@recipe.ingredients.push(@ingredient)
	erb(:recipe)
end

post '/recipe/:id/instruction' do
	@recipe = Recipe.find(params['id'].to_i())
	@instruction = @recipe.update({instruction: params['instruction']})
	redirect "/recipe/#{@recipe.id}"
end

get '/recipe/:recipe_id/ingredient/:id' do
	@recipe = Recipe.find(params['recipe_id'].to_i())
	@ingredient = Ingredient.find(params['id'].to_i())
	erb(:ingredient)
end

delete '/recipe/:recipe_id/ingredient/:id' do
	@ingredient = Ingredient.find(params['id'].to_i())
	@recipe = Recipe.find(params['recipe_id'].to_i())
	@recipe.ingredients.destroy(@ingredient)
	redirect "/recipe/#{@recipe.id}"
end

get '/recipe/:id/other' do
	@recipe = Recipe.find(params['id'].to_i())
	redirect "/recipe/#{@recipe.id}"
end

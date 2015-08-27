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

post '/recipes' do
	@recipe = Recipe.create({ name: params['name'] })
	redirect '/recipes'
end

get '/recipe/:id' do
	@recipe = Recipe.find(params['id'].to_i())
	erb(:recipe)
end

patch '/recipe/:id' do #NOT WORKING!!!!!!
	@recipe = Recipe.find(params['id'].to_i())
	@recipe.update({name: params['name']})
	erb(:recipe)
end

delete '/recipes/:id' do
	@recipe = Recipe.find(params['id'].to_i())
	@recipe.destroy()
	redirect '/recipes'
end

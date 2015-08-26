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

require('sinatra')
require('sinatra/contrib/all')

# required controller files
require_relative('./controllers/vets_controller')
require_relative('./controllers/animals_controller')

# required model files
require_relative('./models/vet')
require_relative('./models/animal')
also_reload('./models/*')

get '/' do
  erb(:index)
end

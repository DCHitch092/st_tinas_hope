require('sinatra')
require('sinatra/contrib/all')

# required controller files
require_relative('./controllers/vets_controller')

# required model files
require_relative('./models/vet')
# also_reload('./models/*')

get '/' do
  erb(:index)
end

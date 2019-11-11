require('sinatra')
require('sinatra/contrib/all')
require('pry')

# required controller files
require_relative('./controllers/vets_controller')
require_relative('./controllers/animals_controller')
require_relative('./controllers/humans_controller')
require_relative('./controllers/notes_controller')
# require_relative('./controllers/human_assign_controller')
# require_relative('./controllers/vet_assign_controller')

# required model files
require_relative('./models/vet')
# require_relative('./models/vet_assign')
require_relative('./models/animal')
require_relative('./models/human')
# require_relative('./models/human_assign')
also_reload('./models/*')

get '/' do
  erb(:index)
end

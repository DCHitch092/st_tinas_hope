require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/vet')
also_reload('./models/*')

get '/' do
  erb(:index)
end

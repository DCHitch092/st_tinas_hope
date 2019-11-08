get '/vets' do #index
  @vets = Vet.all
  erb(:'vets/index')
end

get '/vets/new' do #new
  erb(:'vets/new')
end

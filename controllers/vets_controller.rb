get '/vets' do #index
  @vets = Vet.all
  erb(:'vets/index')
end

get '/vets/new' do #new
  erb(:'vets/new')
end

post '/vets' do #create
  @new_vet = Vet.new(params)
  @new_vet.save()
  erb(:'vets/create')
end

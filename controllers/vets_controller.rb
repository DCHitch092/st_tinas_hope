get '/vets' do #index
  @vets = Vet.all
  erb(:'vets/index')
end

get '/vets/new' do #new
  erb(:'vets/new')
end

get '/vets/:id' do #show
  @vet_id = params[:id]
  @vet = Vet.find(@vet_id)
  erb(:'vets/show')
end

get '/vets/:id/edit' do #edit
  @vet_id = params[:id]
  @vet = Vet.find(@vet_id)
  erb(:'vets/edit')
end

post '/vets' do #create
  @new_vet = Vet.new(params)
  @new_vet.save()
  erb(:'vets/create')
end

post '/vets/:id' do #update
  Vet.new(params).update()
  erb(:'vets/update')
end

post '/vets/:id/delete' do #delete
  vet_id = params[:id]
  vet = Vet.find(vet_id)
  # binding.pry
  vet.delete()
  redirect to '/vets'
end

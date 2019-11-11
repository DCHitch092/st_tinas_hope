get '/animals' do #index
  @animals = Animal.all()
  erb(:'animals/index')
end

get '/animals/new' do #new
  @humans = Human.all()
  @vets = Vet.all()
  erb(:'animals/new')
end

get '/animals/:id' do #show
  animal_id = params[:id]
  @animal = Animal.find(animal_id)
  erb(:'animals/show')
end

get '/animals/:id/edit' do #edit
  animal_id = params[:id]
  @animal = Animal.find(animal_id)
  @humans = Human.all()
  @vets = Vet.all()
  erb(:'animals/edit')
end

get '/animals/:id/notes' do #show-notes
  animal_id = params[:id]
  @animal = Animal.find(animal_id)
  @notes = Note.find_by_animal(animal_id)
  # @humans = Human.all()
  # @vets = Vet.all()
  erb(:'animals/notes')
end

post '/animals' do #create
  @new_animal=Animal.new(params)
  @new_animal.new_animal()
  erb(:'animals/create')
end

post '/animals/:id' do #update
  Animal.new(params).update()
  erb(:'animals/update')
end

post '/animals/:id/delete' do #delete
  animal_id = params[:id]
  animal = Animal.find(animal_id)
  animal.delete()
  redirect to '/animals'
end

get '/animals' do #index
  @animals = Animal.all()
  erb(:'animals/index')
end

get '/animals/new' do #new
  erb(:'animals/new')
end

get '/animals/:id' do #show
  @animal_id = params[:id]
  @animal = Animal.find(@animal_id)
  erb(:'animals/show')
end

get '/animals/:id/edit' do #show
  @animal_id = params[:id]
  @animal = Animal.find(@animal_id)
  erb(:'animals/edit')
end

post '/animals' do #create
  @new_animal = Animal.new(params)
  @new_animal.save()
  erb(:'animals/create')
end

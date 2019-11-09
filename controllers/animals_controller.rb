get '/animals' do #index
  @animals = Animal.all()
  erb(:'animals/index')
end

get '/animals/new' do #new
  erb(:'animals/new')
end

post '/animals' do #create
  @new_animal = Animal.new(params)
  @new_animal.save() 
  erb(:'animals/create')
end

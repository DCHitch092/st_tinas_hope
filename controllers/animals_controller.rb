get '/animals' do #index
  @animals = Animal.all()
  erb(:'animals/index')
end

get '/animals/new' do #new
  erb(:'animals/new')
end 

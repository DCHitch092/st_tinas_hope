get '/animals' do #index
  @animals = Animal.all()
  erb(:'animals/index')
end

get '/notes' do   #index
  @animals = Animal.all()
  erb(:'notes/index')
end

get '/notes' do   #index
  @animals = Animal.all()
  erb(:'notes/index')
end

get '/notes/:id' do #show
  @note = Note.find(params[:id])
  erb(:'notes/show')
end 

get '/notes' do   #index
  @notes = Note.all()
  erb(:'notes/index')
end

get '/notes/:id' do #show
  @note = Note.find(params[:id])
  @vet_name = @note.get_author()
  erb(:'notes/show')
end

get '/notes/new' do #show
  @animals = Animal.all()
  erb(:'notes/new')
end

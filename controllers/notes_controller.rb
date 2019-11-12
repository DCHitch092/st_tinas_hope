get '/notes' do   #index
  @notes = Note.all()
  erb(:'notes/index')
end

get '/notes/:id' do #show
  note_id = params[:id]
  @note = Note.find(note_id)
  @vet_name = @note.get_author()
  erb(:'notes/show')
end

get '/notes/new' do #new
  @animals = Animal.all()
  erb(:'notes/new')
end

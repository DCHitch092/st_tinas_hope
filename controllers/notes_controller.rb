get '/notes' do   #index
  @notes = Note.all()
  erb(:'notes/index')
end

get '/notes/new' do #new
  @animals = Animal.all()
  @vets = Vet.all()
  erb(:'notes/new')
end

get '/notes/:id' do #show
  note_id = params[:id]
  @note = Note.find(note_id)
  @vet_name = @note.get_author()
  @animal_name = @note.get_patient()
  @human_name = @note.get_human()
  erb(:'notes/show')
end

post '/notes' do #create
  new_post = Note.new(params)
  new_post.save()
  redirect to '/notes'
end

get '/notes' do   #index
  @notes = Note.all()
  erb(:'notes/index')
end

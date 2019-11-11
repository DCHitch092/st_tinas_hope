get '/notes' do   #index
  @notes = Note.all()
  erb(:'notes/index')
end

get '/notes/:id' do #show
  @note = Note.find(params[:id])
  erb(:'notes/show')
end

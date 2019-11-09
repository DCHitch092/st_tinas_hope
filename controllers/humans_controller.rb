get '/humans' do #index
  @humans = Human.all()
  erb(:'humans/index')
end

get '/humans/new' do #new
  erb(:'humans/new')
end

post '/humans' do #create
  human = Human.new(params)
  human.save()
  erb(:'humans/create')
end

get '/humans/:id/edit' do #edit
  @human_id = params[:id]
  @human = Human.find(@human_id)
  erb(:'humans/edit')
end

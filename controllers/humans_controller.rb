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

get '/humans/:id' do #show
  human_id = params[:id]
  @human = Human.find(human_id)
  @animals = Human.assigned_animals(human_id)
  erb(:'humans/show')
end

get '/humans/:id/edit' do #edit
  human_id = params[:id]
  @human = Human.find(human_id)
  erb(:'humans/edit')
end

post '/humans/:id' do #update
  Human.new(params).update()
  erb(:'humans/update')
end

post '/humans/:id/delete' do #delete
  human_id = params[:id]
  Human.delete(human_id)
  redirect to '/humans'
end

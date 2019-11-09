get '/humans' do #index
  @humans = Human.all()
  erb(:'humans/index')
end

get '/humans/new' do #new
  erb(:'humans/new')
end

post '/humans' do #create
  human = Human.new(params)
  erb(:'humans/create')
end 

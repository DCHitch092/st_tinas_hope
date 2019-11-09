get '/humans' do #index
  @humans = Human.all()
  erb(:'humans/index')
end

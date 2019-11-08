get '/vets' do
  @vets = Vets.all
  erb(:'vets/index')
end

get '/vets' do
  @vets = Vet.all
  erb(:'vets/index')
end

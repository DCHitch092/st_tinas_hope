# get '/human-assign/:human_id/new-animal' do #new
#   @human_id = params[:human_id]
#   erb(:'human_assign/new')
# end

post '/human-assign/:animal_id/assign-human' do #create
  @animal_id = params[:animal_id]
  @human_id = params[:human_id]
  new_assign = HumanAssign.new({
    'animal_id' => @animal_id,
    'human_id' => @human_id})
    # binding.pry
  new_assign.save()
  redirect to '/animals'
end

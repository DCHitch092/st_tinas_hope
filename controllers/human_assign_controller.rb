get '/human-assign/:human_id/new-animal' do #new
  human_id = params[:human_id]
  erb(:'human_assign/new')
end

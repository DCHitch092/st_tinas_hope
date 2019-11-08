require ('pg')

class Vet

  attr_reader :id, :name, :role, :fav_colour, :profile_image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @role = options['role']
    @fav_colour = options['fav_colour']
    @profile_image = options['profile_image']
  end
  
end

require ('pg')
require_relative('../db/sql_runner')

class Vet

  attr_reader :id, :name, :role, :fav_colour, :profile_image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @role = options['role']
    @fav_colour = options['fav_colour']
    @profile_image = options['profile_image']
  end

  def save()
    sql = "INSERT INTO vets
    ( name, role, fav_colour, profile_image )
    VALUES
    ( $1, $2, $3, $4 )
    RETURNING id;"
    values = [ @name, @role, @fav_colour, @profile_image ]
    result = SqlRunner.run( sql, values)[0]
    @id = result['id'].to_i
  end

end

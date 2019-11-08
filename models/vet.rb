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

  def update()
    sql = "UPDATE vets SET
    name = $1,
    role = $2,
    fav_colour = $3,
    profile_image = $4,
    id = $5"
    values = [ @name, @role, @fav_colour, @profile_image, @id ]
    SqlRunner.run(  sql, values )
  end

  def delete()
    sql = "DELETE FROM vets
    WHERE id = $1"
    values = [ @id ]
    SqlRunner.run(  sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run( sql )
  end

end
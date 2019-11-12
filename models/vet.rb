require ('pg')
require_relative('../db/sql_runner')

class Vet

  attr_reader :id, :vet_name, :role, :fav_colour, :profile_image, :deleted

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @vet_name = options['vet_name']
    @role = options['role']
    @fav_colour = options['fav_colour']
    @profile_image = options['profile_image']
    @deleted = options['deleted']
  end

  def save()
    sql = "INSERT INTO vets
    ( vet_name, role, fav_colour, profile_image, deleted )
    VALUES
    ( $1, $2, $3, $4, $5 )
    RETURNING id;"
    values = [ @vet_name, @role, @fav_colour, @profile_image, @deleted ]
    result = SqlRunner.run( sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE vets SET
    vet_name = $1,
    role = $2,
    fav_colour = $3,
    profile_image = $4,
    deleted = $5
    WHERE
    id = $6"
    values = [ @vet_name, @role, @fav_colour, @profile_image, @deleted, @id ]
    SqlRunner.run(  sql, values )
  end

  def delete()
    @deleted = TRUE
    sql = "UPDATE vets SET
    vet_name = $1,
    role = $2,
    fav_colour = $3,
    profile_image = $4,
    deleted = $5
    WHERE
    id = $6"
    values = [ @vet_name, @role, @fav_colour, @profile_image, @deleted, @id ]
    SqlRunner.run(  sql, values )
  end

  # def self.assigned_to_vet(id)
  #   sql = "SELECT * FROM animals
  #   INNER JOIN vet_assign
  #   ON vet_assign.animal_id = animals.id
  #   WHERE vet_assign.vet_id = $1"
  #   values = [id]
  #   result = SqlRunner.run(sql, values)
  #   return result.map{ |animal| Animal.new(animal)}
  # end

  def get_animals()
    sql = "SELECT * FROM animals
    INNER JOIN humans
    ON animals.human_id = humans.id
    WHERE animals.vet_id = $1"
    values = [@id]
    result = SqlRunner.run(  sql, values)
    # return result.map{|animal| Animal.new(animal)}
  end

  def self.find_unassigned()
    sql = "SELECT * FROM vets
    WHERE vet_name = $1"
    values = ["Unassigned"]
    vet = SqlRunner.run(  sql, values)[0]
    return result = Vet.new(vet)
  end


  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM vets
    ORDER BY deleted ASC"
    result = SqlRunner.run(sql)
    return result.map{ |vet|  Vet.new(vet)}
  end

  def self.find(id)
    sql = "SELECT * FROM vets
    WHERE id = $1 "
    values = [id]
    vet = SqlRunner.run( sql, values)[0]
    return result = Vet.new(vet)
  end

end

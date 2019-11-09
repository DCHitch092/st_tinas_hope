require('pg')
require_relative('../db/sql_runner')

class Animal

  attr_reader :id, :name, :date_of_birth, :type, :fav_colour, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @fav_colour = options['fav_colour']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO animals
    ( name, date_of_birth, type, fav_colour, age)
    VALUES
    ( $1, $2, $3, $4, $5)
    RETURNING id"
    values = [ @name, @date_of_birth, @type, @fav_colour, @age]
    result = SqlRunner.run(  sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE animals SET
    name = $1,
    date_of_birth = $2,
    type = $3,
    fav_colour = $4,
    age = $5
    WHERE
    id = $6"
    values = [@name, @date_of_birth, @type, @fav_colour, @age, @id]
    SqlRunner.run( sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(  sql, values)[0]
    return result
  end

  def self.all()
    sql = "SELECT * FROM animals"
    result = SqlRunner.run(  sql)
    return result.map{ |animal| Animal.new(animal)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql)
  end

end

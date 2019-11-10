require('pg')
require_relative('../db/sql_runner')

class Human

  attr_reader :id, :name, :email, :address, :phone, :fav_colour

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email = options['email']
    @address = options['address']
    @phone = options['phone']
    @fav_colour = options['fav_colour'].to_str
  end

  def save()
    sql = "INSERT INTO humans
    ( name, email, address, phone, fav_colour)
    VALUES
    ( $1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @email, @address, @phone, @fav_colour]
    result = SqlRunner.run( sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE humans SET
    name = $1,
    email = $2,
    address = $3,
    phone = $4,
    fav_colour = $5
    WHERE id = $6"
    values = [@name, @email, @address, @phone, @fav_colour, @id]
    SqlRunner.run(  sql, values)
  end

  def self.assigned_to_human(id)
    sql = "SELECT * FROM animals
    INNER JOIN human_assign
    ON human_assign.animal_id = animals.id
    WHERE human_assign.human_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map{ |animal| Animal.new(animal)}
  end

  def self.delete(id)
    sql = "DELETE FROM humans
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM humans
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values)[0]
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM humans"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM humans"
    result = SqlRunner.run(sql)
    return result.map{|human| Human.new(human)}
  end

end

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


end

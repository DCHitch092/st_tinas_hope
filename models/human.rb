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
    @fav_colour = options['fav_colour']
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

  def self.delete_all()
    sql = "DELETE FROM humans"
    SqlRunner.run(sql)
  end 

end

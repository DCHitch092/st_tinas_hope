require('pg')
require_relative('../db/sql_runner')

class Dog

  attr_reader :id, :name, :date_of_birth, :type, :fav_colour, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @fav_colour = options['fav_colour']
    @age = options['age'].to_i
  end


end

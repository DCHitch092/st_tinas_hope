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
end

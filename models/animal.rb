require('pg')
require_relative('../db/sql_runner')

class Animal

  attr_accessor :human_id
  attr_reader :id, :name, :date_of_birth, :type, :fav_colour, :age


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @fav_colour = options['fav_colour']
    @age = options['age'].to_i
    @human_id = options['human_id'].to_i
  end

  def save()
    sql = "INSERT INTO animals
    ( name, date_of_birth, type, fav_colour, age, human_id)
    VALUES
    ( $1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [ @name, @date_of_birth, @type, @fav_colour, @age, @human_id]
    result = SqlRunner.run(  sql, values)[0]
    @id = result['id'].to_i
  end

  def new_animal()
    if @date_of_birth == nil
      @date_of_birth = self.get_dob()
    else
      @age = self.get_age()
    end
    self.save()
    # binding.pry
    return self
  end

  def update()
    sql = "UPDATE animals SET
    name = $1,
    date_of_birth = $2,
    type = $3,
    fav_colour = $4,
    age = $5,
    human_id = $6
    WHERE
    id = $7"
    values = [@name, @date_of_birth, @type, @fav_colour, @age, @human_id, @id ]
    SqlRunner.run( sql, values)
  end

  def get_human()
    id = @human_id
    sql = "SELECT * FROM humans
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(  sql, values)[0]
    return result
  end

  # def delete()
  #   sql = "DELETE FROM animals
  #   WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run( sql, values)
  # end

  # def get_vet()
  # end

  def get_dob()
    time = Time.new
    current_date = "#{time.year}-#{time.month}-#{time.day}"
    # time.strftime("%Y-%m-%d")
    if self.age
      years = self.age
      years_in_seconds = years * 365 * 24 * 60 * 60
      dob = time - years_in_seconds
    end
    return dob.strftime("%Y-%m-%d")
  end

  def get_age()
    time = Time.new.to_i
    # current_date = "#{time.year}-#{time.month}-#{time.day}"
    # time.strftime("%Y-%m-%d")
    if self.date_of_birth
      date_of_birth = Time.new(self.date_of_birth)
      difference = time - date_of_birth.to_i
      years_in_seconds = 365 * 24 * 60 * 60
      age = difference/years_in_seconds
    end
    return age
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

  def self.delete(id)
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql)
  end

end

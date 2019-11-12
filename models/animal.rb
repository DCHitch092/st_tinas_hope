require('pg')
require_relative('../db/sql_runner')
require_relative('../models/vet')

class Animal

  attr_accessor :human_id
  attr_reader :id, :animal_name, :date_of_birth, :type, :fav_colour, :age, :vet_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_name = options['animal_name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @fav_colour = options['fav_colour']
    @age = options['age'].to_i
    @human_id = options['human_id'].to_i
    @vet_id = options['vet_id'].to_i
  end

  def save()
    sql = "INSERT INTO animals
    ( animal_name, date_of_birth, type, fav_colour, age, human_id, vet_id)
    VALUES
    ( $1, $2, $3, $4, $5, $6, $7)
    RETURNING id"
    values = [ @animal_name, @date_of_birth, @type, @fav_colour, @age, @human_id, @vet_id]
    result = SqlRunner.run(  sql, values)[0]
    @id = result['id'].to_i
  end

  def new_animal()
    if @date_of_birth == ''
      @date_of_birth = self.get_dob()
    else
      @age = self.get_age()
    end
    self.save()
    return self
  end

  def update_animal()
    if @date_of_birth == ''
      @date_of_birth = self.get_dob()
    else
      @age = self.get_age()
    end
    self.update()
    return self
  end

  def update()
    sql = "UPDATE animals SET
    animal_name = $1,
    date_of_birth = $2,
    type = $3,
    fav_colour = $4,
    age = $5,
    human_id = $6,
    vet_id = $7
    WHERE
    id = $8"
    values = [@animal_name, @date_of_birth, @type, @fav_colour, @age, @human_id, @vet_id, @id ]
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

  def get_vet()
    id = @vet_id
    sql = "SELECT * FROM vets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql,  values)[0]
    return result
  end

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

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def colour_string()
    @fav_colour.slice!(1..6)
    return @fav_colour
  end

  def self.waiting_room()
    vet = Vet.find_unassigned()
    sql = "SELECT * From animals
    INNER JOIN humans
    on animals.human_id = humans.id
    WHERE vet_id = $1"
    values = [vet.id]
    result = SqlRunner.run(  sql, values)
    # return result.map{|animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal = SqlRunner.run( sql, values)[0]
    return result = Animal.new(animal)
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

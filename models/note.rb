require('pg')
require_relative('../db/sql_runner')

class Note

  attr_reader :id, :animal_id, :vet_id, :body, :timestamp

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @vet_id = options['vet_id'].to_i
    @body = options['body']
    @timestamp = options['timestamp']
  end

  def save()
    @timestamp = Time.new if @timestamp == nil
    sql = "INSERT INTO notes
    ( animal_id, vet_id, body, timestamp)
    VALUES
    ( $1, $2, $3, $4)
    RETURNING id"
    values = [@animal_id, @vet_id, @body, @timestamp]
    result = SqlRunner.run(  sql, values)[0]
    @id = result['id']
  end

  def get_author()
    sql = "SELECT vets.vet_name FROM vets
    INNER JOIN notes
    ON notes.vet_id = vets.id
    WHERE notes.id = $1"
    values = [@id]
    result = SqlRunner.run(  sql, values)[0]
    return result
  end

  def self.find_by_animal(id)
    sql = "SELECT * FROM notes
    WHERE animal_id = $1
    ORDER BY notes.timestamp DESC"
    values = [id]
    result = SqlRunner.run( sql, values)
    return result.map{|note| Note.new(note)}
  end

  def get_patient()
    sql = "SELECT animals.animal_name FROM animals
    INNER JOIN notes
    ON notes.animal_id = animals.id
    WHERE notes.id = $1"
    values = [@id]
    result = SqlRunner.run(  sql, values)[0]
    return result
  end

  def get_time()
    time = self.timestamp
    date = Time.parse time
    return date.strftime("%e %b, %y (%H:%M)")
  end

  def self.find(id)
    sql = "SELECT * FROM notes
    where id = $1"
    values = [id]
    result = SqlRunner.run( sql,  values)[0]
    return note = Note.new(result)
  end


  def self.all()
    sql = "SELECT * FROM notes"
    result = SqlRunner.run(sql)
    return result.map {|note| Note.new(note)}
  end

  def self.delete_all()
    sql = "DELETE FROM notes"
    SqlRunner.run(sql)
  end
end

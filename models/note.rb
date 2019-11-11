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
    sql = "INSERT INTO notes
    ( animal_id, vet_id, body, timestamp)
    VALUES
    ( $1, $2, $3, $4)
    RETURNING id"
    values = [@animal_id, @vet_id, @body, @timestamp]
    result = SqlRunner.run(  sql, values)[0]
    @id = result['id']
  end

  def self.delete_all()
    sql = "DELETE FROM notes"
    SqlRunner.run(sql)
  end 
end

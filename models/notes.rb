require('pg')
require_relative('../db/sql_runner')

class Notes

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
    ( $1, $2, $3, $4, $5)
    RETURNING id"
    values = [@animal_id, @vet_id, @body, @timestamp, @id]
    result = SqlRunner.run(  sql, values)[0]
    @id = result['id']
  end
  
end

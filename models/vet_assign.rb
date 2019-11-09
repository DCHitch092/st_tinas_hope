require('pg')
require_relative('../db/sql_runner')

class VetAssign

  attr_reader :id, :animal_id, :vet_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @vet_id = options['vet_id'].to_i
  end

  def save()
    sql = "INSERT INTO vet_assign
    ( animal_id, vet_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@animal_id, @vet_id]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

end

require('pg')
require_relative('../db/sql_runner')

class HumanAssign

  attr_reader :id, :animal_id, :human_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @human_id = options['human_id'].to_i
  end

  def save()
    sql = "INSERT INTO human_assign
    ( animal_id, human_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@animal_id, @human_id]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

end

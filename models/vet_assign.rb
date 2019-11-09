require('pg')
require_relative('../db/sql_runner')

class VetAssign

  attr_reader :id, :animal_id, :vet_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id'].to_i
    @vet_id = options['vet_id'].to_i
  end
end

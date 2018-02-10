require_relative('../db/sql_runner.rb')

class Screening

  attr_accessor :movie_id, :screening_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @screening_time = options['screening_time']
  end

end

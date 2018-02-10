require_relative('../db/sql_runner.rb')

class Screening

  attr_accessor :movie_id, :screening_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @screening_time = options['screening_time']
  end

  def save()
    sql = "INSERT INTO screenings (movie_id, screening_time) VALUES ($1, $2) RETURNING id"
    values = [@movie_id, @screening_time]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

end

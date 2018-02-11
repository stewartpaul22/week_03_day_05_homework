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

  def edit()
    sql = "UPDATE screenings SET (movie_id, screening_time) = ($1, $2) WHERE id = $3"
    values = [@movie_id, @screening_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map { |screening| Screening.new(screening)}
  end

  def delete()

  end

  def self.delete_all()

  end

end

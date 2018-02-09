require_relative('../db/sql_runner.rb')

class Ticket

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @movie_id = options['movie_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, movie_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @movie_id]
    ticket = SqlRunner.run(sql, values).first
    @id = tickets['id'].to_i
  end

  def edit()
  end

  def self.all()
  end

  def delete()
  end

  def self.delete_all()
  end

end

require_relative('../db/sql_runner.rb')

class Ticket

  attr_accessor :movie_id, :customer_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @movie_id = options['movie_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, movie_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @movie_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def edit()
    sql = "UPDATE tickets SET (customer_id, movie_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @movie_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id=$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end

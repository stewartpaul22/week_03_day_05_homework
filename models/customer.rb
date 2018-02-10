require_relative('../db/sql_runner.rb')

class Customer

  attr_accessor :funds, :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def edit()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id=$3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  def update_wallet()
    pending_movies = booked_movies()
    pending_movies.map { |movie| @funds -= movie.price }
    edit()
  end

  def booked_movies()
    sql = "SELECT movies.* FROM movies INNER JOIN tickets ON movies.id = tickets.movie_id WHERE customer_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values)
    return movies.map{|movie| Movie.new(movie)}
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values =[]
    SqlRunner.run(sql, values)
  end

end

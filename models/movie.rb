require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO movies (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def edit()
    sql = "UPDATE movies SET (title, price) = ($1, $2) WHERE id=$3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    return movies.map{|movie| Movie.new(movie)}
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE movie_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  def number_of_customers()
    return customers().count()
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    values =[]
    SqlRunner.run(sql, values)
  end

end

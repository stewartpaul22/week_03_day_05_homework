require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title

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
    return movies.map{|customer| Customer.new(customer)}
  end

  

end

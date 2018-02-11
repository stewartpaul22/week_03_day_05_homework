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
    movies = SqlRunner.run(sql)
    return movies.map{ |movie| Movie.new(movie) }
  end

  def screenings()
    sql = "SELECT * FROM screenings WHERE movie_id = $1"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    return screenings.map { |screening| Screening.new(screening) }
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE movie_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{ |customer| Customer.new(customer) }
  end

  def number_of_customers()
    return customers().count()
  end

  def most_popular_time()
    id = most_popular_time_by_id()
    sql = "SELECT screening_time FROM screenings WHERE id = $1"
    values = [id]
    return SqlRunner.run(sql, values).first['screening_time']
  end

  def most_popular_time_by_id()
    tickets = get_tickets()
    screening_count = []
    for ticket in tickets
      screening_count << ticket.screening_id
    end
    most_pop_id = screening_count.max_by{|x| screening_count.count(x) }
    return most_pop_id
  end

  def get_tickets()
    sql = "SELECT tickets.* FROM tickets WHERE movie_id=$1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map{ |ticket| Ticket.new(ticket) }
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

end

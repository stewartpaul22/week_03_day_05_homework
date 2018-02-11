require('pry-byebug')
require_relative('models/customer.rb')
require_relative('models/movie.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

# <editor-fold> Customers
customer1 = Customer.new({'name' => 'Jeff', 'funds' => '55'})
customer2 = Customer.new({'name' => 'Julie', 'funds' => '34'})
customer3 = Customer.new({'name' => 'John', 'funds' => '33'})
customer4 = Customer.new({'name' => 'Steve', 'funds' => '10'})
customer1.save()
customer2.save()
customer3.save()
customer4.save()
#</editor-fold>

#<editor-fold> Movies
movie1 = Movie.new({'title' => 'The Big Lebowski', 'price' => '5'})
movie2 = Movie.new({'title' => 'The Vanishing', 'price' => '5'})
movie3 = Movie.new({'title' => 'Arlington Road', 'price' => '5'})
movie4 = Movie.new({'title' => 'Con Air', 'price' => '5'})
movie5 = Movie.new({'title' => 'Magnolia', 'price' => '5'})
movie6 = Movie.new({'title' => 'Fallen', 'price' => '5'})
movie1.save()
movie2.save()
movie3.save()
movie4.save()
movie5.save()
movie6.save()
#</editor-fold>

#<editor-fold> Tickets
ticket1 = Ticket.new({'customer_id' => customer1.id, 'movie_id' => movie1.id})
ticket2 = Ticket.new({'customer_id' => customer1.id, 'movie_id' => movie2.id})
ticket3 = Ticket.new({'customer_id' => customer1.id, 'movie_id' => movie3.id})
ticket4 = Ticket.new({'customer_id' => customer2.id, 'movie_id' => movie1.id})
ticket5 = Ticket.new({'customer_id' => customer2.id, 'movie_id' => movie5.id})
ticket6 = Ticket.new({'customer_id' => customer3.id, 'movie_id' => movie1.id})
ticket7 = Ticket.new({'customer_id' => customer3.id, 'movie_id' => movie6.id})
ticket8 = Ticket.new({'customer_id' => customer4.id, 'movie_id' => movie1.id})
ticket9 = Ticket.new({'customer_id' => customer4.id, 'movie_id' => movie4.id})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()
ticket8.save()
ticket9.save()
#</editor-fold>

# <editor-fold> Screenings
screening1 = Screening.new({'movie_id' => movie1.id, 'screening_time' => '13:00'})
screening2 = Screening.new({'movie_id' => movie1.id, 'screening_time' => '15:30'})
screening3 = Screening.new({'movie_id' => movie1.id, 'screening_time' => '18:00'})
screening4 = Screening.new({'movie_id' => movie1.id, 'screening_time' => '20:30'})
screening1.save()
screening2.save()
screening3.save()
screening4.save()
screening5 = Screening.new({'movie_id' => movie2.id, 'screening_time' => '13:00'})
screening6 = Screening.new({'movie_id' => movie2.id, 'screening_time' => '15:30'})
screening7 = Screening.new({'movie_id' => movie2.id, 'screening_time' => '18:00'})
screening8 = Screening.new({'movie_id' => movie2.id, 'screening_time' => '20:30'})
screening5.save()
screening6.save()
screening7.save()
screening8.save()
screening9 = Screening.new({'movie_id' => movie3.id, 'screening_time' => '13:00'})
screening10 = Screening.new({'movie_id' => movie3.id, 'screening_time' => '15:30'})
screening11 = Screening.new({'movie_id' => movie3.id, 'screening_time' => '18:00'})
screening12 = Screening.new({'movie_id' => movie3.id, 'screening_time' => '20:30'})
screening9.save()
screening10.save()
screening11.save()
screening12.save()
screening13 = Screening.new({'movie_id' => movie4.id, 'screening_time' => '13:00'})
screening14 = Screening.new({'movie_id' => movie4.id, 'screening_time' => '15:30'})
screening15 = Screening.new({'movie_id' => movie4.id, 'screening_time' => '18:00'})
screening16 = Screening.new({'movie_id' => movie4.id, 'screening_time' => '20:30'})
screening13.save()
screening14.save()
screening15.save()
screening16.save()
screening17 = Screening.new({'movie_id' => movie5.id, 'screening_time' => '13:00'})
screening18 = Screening.new({'movie_id' => movie5.id, 'screening_time' => '15:30'})
screening19 = Screening.new({'movie_id' => movie5.id, 'screening_time' => '18:00'})
screening20 = Screening.new({'movie_id' => movie5.id, 'screening_time' => '20:30'})
screening17.save()
screening18.save()
screening19.save()
screening20.save()
screening21 = Screening.new({'movie_id' => movie6.id, 'screening_time' => '13:00'})
screening22 = Screening.new({'movie_id' => movie6.id, 'screening_time' => '15:30'})
screening23 = Screening.new({'movie_id' => movie6.id, 'screening_time' => '18:00'})
screening24 = Screening.new({'movie_id' => movie6.id, 'screening_time' => '20:30'})
screening21.save()
screening22.save()
screening23.save()
screening24.save()
# </editor-fold>

binding.pry
nil

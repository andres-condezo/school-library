class Rental
  # accessor get and set method
  attr_accessor :date
  attr_reader :book, :person

  # Constructor to initialize the class Person
  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
end

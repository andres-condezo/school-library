class Rental
  # accessor get and set method
  attr_accessor :date, :person, :book

  # Constructor to initialize the class Person
  def initialize(date, person, book)
    @date = date

    @person = person
    person.rental << self

    @book = book
    book.rental << self
  end
end

require './rental'

class Book
  # accessor get and set method
  attr_accessor :title, :author, :rental

  # Constructor to initialize the class Person
  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

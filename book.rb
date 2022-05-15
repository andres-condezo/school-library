require './rental'

class Book
  # accessor get and set method
  attr_accessor :title, :author
  attr_reader :rentals

  # Constructor to initialize the class Person
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

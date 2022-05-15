require './rental'

class Book
  # accessor get and set method
  attr_accessor :title, :author, :rentals

  # Constructor to initialize the class Person
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

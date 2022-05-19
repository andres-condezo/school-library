class Rental
  # accessor get and set method
  attr_accessor :date, :person, :book

  # Constructor to initialize the class Person
  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@date, @person, @book]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end

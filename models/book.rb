require_relative 'rental'

class Book
  # accessor get and set method
  attr_accessor :title, :author, :rentals

  # Constructor to initialize the class Person
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end

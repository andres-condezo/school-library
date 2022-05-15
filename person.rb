# Person: A class to define attributes and behaviors
require './decorators'
require './rental'

class Person < Nameable
  # accessor get and set method
  attr_accessor :name, :age, :rental
  attr_reader :id

  # Constructor to initialize the class Person
  def initialize(age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def can_use_services?
    of_age? == true || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

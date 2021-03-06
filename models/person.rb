# Person: A class to define attributes and behaviors
require_relative 'decorators'
require_relative 'rental'

class Person < Nameable
  # accessor get and set method
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id

  # Constructor to initialize the class Person
  def initialize(age, name = 'Unknown', id = nil, parent_permission = 'true')
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? == true || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

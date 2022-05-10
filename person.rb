# Person: A class to define attributes and behaviors
class Person
  # accessor get and set method
  attr_accessor :name, :age
  attr_reader :id

  # Constructor to initialize the class Person
  def initialize(age, name = 'Unknown', parent_permission = 'true')
    @id = "#{Random.rand(1..1000)}-#{name}"
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? == true || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

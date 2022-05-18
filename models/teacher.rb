# Teacher: A class to define attributes and behaviors of the teacher class.

require_relative 'person'

class Teacher < Person
  # accessor get and set method
  attr_accessor :specialization

  # Constructor to initialize
  def initialize(age, name, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# Teacher: A class to define attributes and behaviors of the teacher class.
class Teacher < Person
  # Constructor to initialize
  def initialize(age, name, parent_permission, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

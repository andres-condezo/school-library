# Student: A class to define attributes and behaviors of the student class.
class Student < Person
  # Constructor to initialize
  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

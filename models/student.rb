# Student: A class to define attributes and behaviors of the student class.

require_relative 'person'

class Student < Person
  # accessor get and set method
  attr_accessor :classroom

  # Constructor to initialize
  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

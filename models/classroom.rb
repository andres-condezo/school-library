class Classroom
  # accessor get and set method
  attr_accessor :label
  attr_reader :students

  # Constructor to initialize the class Person
  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

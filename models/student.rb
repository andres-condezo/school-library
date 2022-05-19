# Student: A class to define attributes and behaviors of the student class.

require_relative 'person'

class Student < Person
  # accessor get and set method
  attr_accessor :classroom

  # Constructor to initialize
  def initialize(age, name, id = nil, parent_permission, classroom)
    super(age, name, id, parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@age, @name, @id, @parent_permission, @classroom]
    }.to_json(*args)
  end

  def self.json_create(object)
    age, name, id, parent_permission, classroom = object['data']
    Student.new(age, name, id, parent_permission, classroom)
  end
end

require './models/book'
require './models/person'
require './models/classroom'
require './models/student'
require './models/teacher'
require './models/rental'
require 'json'

class Library
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_data
  end

  def load_data
    @books = JSON.parse(File.read('./data/books.json'), create_additions: true) if File.exist? './data/books.json'
    @people = JSON.parse(File.read('./data/people.json'), create_additions: true) if File.exist? './data/people.json'
    @rentals = JSON.parse(File.read('./data/rentals.json'), create_additions: true) if File.exist? './data/rentals.json'
  end

  def save_data
    Dir.mkdir('./data') unless Dir.exist?('./data')
    File.write('./data/books.json', JSON.generate(@books)) if @books.empty? == false
    File.write('./data/people.json', JSON.generate(@people)) if @people.empty? == false
    File.write('./data/rentals.json', JSON.generate(@rentals)) if @rentals.empty? == false
  end

  def add_student(age, name, parent_permission, classroom)
    @people << Student.new(age, name, parent_permission, classroom)
  end

  def add_teacher(age, name, specialization)
    @people << Teacher.new(age, name, specialization)
  end

  def add_book(title, author)
    @books << Book.new(title, author)
  end

  def add_rental(date, person, book)
    @rentals << Rental.new(date, person, book)
  end
end

require './book'
require './person'
require './student'
require './teacher'
require './rental'

class App
  attr_reader :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @persons.empty?
      puts 'No Persons Found'
    else
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class}], Name: #{person.name} ID: #{person.id}, Age: #{person.age} "
      end
    end
  end

  def create_a_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    selected_person = gets.chomp
    case selected_person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid selection'
    end
  end

  def create_student
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Has parent permission [Y/N]: '
    parent_permission = gets.chomp
    puts 'Classroom: '
    classroom = gets.chomp
    @persons << Student.new(age, name, parent_permission, classroom)
    puts 'Person Created succesfully'
  end

  def create_teacher
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    @persons << Teacher.new(age, name, specialization)
    puts 'Person Created succesfully'
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created succesfully'
  end

  def create_a_rental
    puts 'Select a person from the following list by serial number'
    list_all_books
    selected_book = @books[gets.chomp.to_i]
    list_all_people
    selected_person = @persons[gets.chomp.to_i]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
    puts 'Rental created succesfully'
  end

  def list_all_rentals
    print 'Id of person: '
    id = gets.chomp.to_i
    person_details = @persons.find { |person| person.id == id }
    if person_details
      puts 'Rentals:'
      person_details.rental.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    else
      puts 'No Rentals Found'
    end
  end
end

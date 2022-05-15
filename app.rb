require './book'
require './person'
require './student'
require './teacher'
require './rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.length.zero?
      puts 'No books found'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title:\"#{book.title}\", Author:#{book.author}"
      end
    end
  end

  def list_all_people
    if @people.length.zero?
      puts 'No poeple found'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}], Name:#{person.name} ID:#{person.id}, Age:#{person.age}"
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
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/N]: '
    parent_permission = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    @people << Student.new(age, name, parent_permission, classroom)
    puts 'Person Created succesfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts 'Person created succesfully'
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
    if @books.length.zero?
      puts 'No books found.'
    elsif @people.length.zero?
      puts 'No people found.'
    else
      puts 'Select a book from the following list by number:'
      list_all_books
      book = @books[gets.chomp.to_i]
      puts 'Select a person from the following list by number: (not id)'
      list_all_people
      person = @people[gets.chomp.to_i]
      print 'Date: (yyyy-mm-dd)'
      date = gets.chomp
      @rentals.push(Rental.new(date, person, book))
      puts 'Rental created succesfully'
    end
  end

  def list_all_rentals
    if @rentals.length.zero?
      puts 'There is no rentals to show'
    else
      print 'ID of person: '
      id = gets.chomp.to_i
      @people.each do |person|
        if person.id == id
          puts "#{person.name} rentals:"
          person.rentals.each do |rental|
            puts "Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
          end
          break
        else
          puts 'There are no rentals for that id'
        end
      end
    end
  end
end

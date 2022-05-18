require './models/book'
require './models/person'
require './models/student'
require './models/teacher'
require './models/rental'
require './models/menu'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @main_menu = MainMenu.new
  end

  def say_hi
    puts 'hi'
  end

  def list_all_books
    if @books.length.zero?
      puts '>> No books found'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title:\"#{book.title}\", Author:#{book.author}"
      end
    end
  end

  def list_all_people
    if @people.length.zero?
      puts '>> No poeple found'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}], Name:#{person.name} ID:#{person.id}, Age:#{person.age}"
      end
    end
  end

  def create_a_person
    print_header
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    selected_person = gets.chomp
    case selected_person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      @main_menu.print_menu
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
    @main_menu.print_menu
    puts '>> Person Created succesfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    @main_menu.print_menu
    puts '>> Person created succesfully'
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    @main_menu.print_menu
    puts '>> Book created succesfully'
  end

  def create_a_rental
    if @books.length.zero?
      puts '>> No books found.'
    elsif @people.length.zero?
      puts '>> No people found.'
    else
      puts 'Select a book from the following list by number:'
      list_all_books
      book = @books[gets.chomp.to_i]
      puts 'Select a person from the following list by number: (not id)'
      list_all_people
      person = @people[gets.chomp.to_i]
      print 'Date: (yyyy-mm-dd)'
      date = gets.chomp
      @rentals << Rental.new(date, person, book)
      @main_menu.print_menu
      puts '>> Rental created succesfully'
    end
  end

  def list_all_rentals
    if @rentals.length.zero?
      puts '>> There is no rentals to show'
    else
      print 'ID of person: '
      id = gets.chomp.to_i
      puts ">> rentals for id:#{id} :"
      puts "\n"
      @rentals.each_with_index do |rental, index|
        if rental.person.id == id
          puts "#{index}) Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
    end
  end

  def run(user_input)
    @main_menu.print_menu
    send(user_input)
  end
end

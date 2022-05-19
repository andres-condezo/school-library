require './models/menu'
require './models/library'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @library = Library.new
    @main_menu = MainMenu.new
  end

  def list_all_books
    puts 'Books list:'
    return puts '>> No books found' if @library.books.empty?

    @library.books.each_with_index do |book, index|
      puts "#{index}) Title:\"#{book.title}\", Author:#{book.author}"
    end
  end

  def list_all_people
    puts 'People list:'
    return puts '>> No people found' if @library.people.empty?

    @library.people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}], Name:#{person.name} ID:#{person.id}, Age:#{person.age}"
    end
  end

  def print_person_menu
    print_header
    puts 'Do you want to create a'
    puts '1) Student'
    puts '2) Teacher'
    puts "\n"
    print '>> Please select a number: '
  end

  def create_a_person
    print_person_menu
    selected_person = gets.chomp
    case selected_person
    when '1'
      age, name, classroom = create_student
      @main_menu.print_menu
      puts '>> Person Created succesfully!'
      puts ">> [Student], Name:#{name}, Age:#{age}, Classroom:#{classroom}"
    when '2'
      age, name, specialization = create_teacher
      @main_menu.print_menu
      puts '>> Person created succesfully!'
      puts ">> [Teacher], Name:#{name}, Age:#{age}, Specialization:#{specialization}"
    else
      @main_menu.print_menu
      puts '>> Invalid selection'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/n]: '
    parent_permission = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    @library.add_student(age, name, parent_permission, classroom)
    [age, name, classroom]
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @library.add_teacher(age, name, specialization)
    [age, name, specialization]
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @library.add_book(title, author)
    @main_menu.print_menu
    puts '>> Book created succesfully!'
    puts ">> Title:\"#{title}\", Author:#{author}"
  end

  def create_a_rental
    return puts '>> No books found, please add a book' if @library.books.empty?
    return puts '>> No people found, please add a person' if @library.people.empty?

    print_header
    list_all_books
    puts "\n"
    print 'Select a book by number: '
    book = @library.books[gets.chomp.to_i]

    print_header
    list_all_people
    puts "\n"
    print 'Select a person by number(not id): '
    person = @library.people[gets.chomp.to_i]

    print_header
    print 'Date(yyyy/mm/dd): '
    date = gets.chomp
    @library.add_rental(date, person, book)

    @main_menu.print_menu
    puts '>> Rental created succesfully!'
    puts ">> [#{person.name} ID:#{person.id}]: Date: #{date} Book: \"#{book.title}\" by #{book.author}"
  end

  def recieve_rentals(id)
    rentals_arr = []
    @library.rentals.each_with_index do |rental, index|
      output = "#{index}) Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
      rentals_arr.push(output) if rental.person.id == id
    end
    rentals_arr
  end

  def recieve_name(id)
    person_name = ''
    @library.people.each do |person|
      person_name = person.name if person.id == id
    end
    person_name
  end

  def list_all_rentals
    message = "Rental list:\n>> There is no rentals to show"
    return puts message if @library.rentals.empty?

    print 'Person ID: '
    person_id = gets.chomp.to_i
    person_name = recieve_name(person_id)
    return puts 'Invalid ID' if person_name == ''

    puts "#{person_name} rentals:"
    puts "\n"
    rental_arr = recieve_rentals(person_id)

    return puts 'There is no rentals to show.' if rental_arr.empty?

    puts rental_arr
  end

  def save_data
    @library.save_data
  end

  def run(user_input)
    @main_menu.print_menu
    send(user_input)
  end
end

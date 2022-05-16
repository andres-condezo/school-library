#!/usr/bin/env ruby
#
require './app'

@main_menu_options = [
  { message: 'List all books', value: '1' },
  { message: 'List all people', value: '2' },
  { message: 'Create a person', value: '3' },
  { message: 'Create a book', value: '4' },
  { message: 'Create a rental', value: '5' },
  { message: 'List all rentals', value: '6' },
  { message: 'Exit', value: '7' }
]

def print_menu(title, menu_options)
  puts title
  menu_options.each do |option|
    puts "#{option[:value]} : #{option[:message]}"
  end
  puts "\n"
end

def menu_operator(app)
  loop do
    puts "\n"
    print_menu("\> please select a option", @main_menu_options)
    user_input = gets.chomp
    case user_input
    when '1' then app.list_all_books
    when '2' then app.list_all_people
    when '3' then app.create_a_person
    when '4' then app.create_a_book
    when '5' then app.create_a_rental
    when '6' then app.list_all_rentals
    else break
    end
  end
end

def main
  app = App.new
  puts "Welcome to School library App!\n"
  menu_operator(app)
  puts 'Thank you for using this app!'
end

main

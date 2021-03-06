class MainMenu
  def initialize
    @main_menu_options = [
      { message: 'List all books', value: '1', method: 'list_all_books' },
      { message: 'List all people', value: '2', method: 'list_all_people' },
      { message: 'Create a person', value: '3', method: 'create_a_person' },
      { message: 'Create a book', value: '4', method: 'create_a_book' },
      { message: 'Create a rental', value: '5', method: 'create_a_rental' },
      { message: 'List all rentals', value: '6', method: 'list_all_rentals' },
      { message: 'Exit', value: '7', method: 'exit' }
    ]
  end

  def print_menu
    print_header
    title = '> Please select a option'
    puts title
    puts "\n"
    @main_menu_options.each do |option|
      puts "#{option[:value]} : #{option[:message]}"
    end
    puts "\n"
    print_div
  end

  def valid_input?(input, menu_options)
    valid_options = menu_options.map { |option| option[:value] }
    valid_options.include?(input)
  end

  def receive_valid_input
    input = gets.chomp
    loop do
      break if valid_input?(input, @main_menu_options)

      print_menu
      puts ">> \"#{input}\" was invalid."
      puts '>> Please enter a valid number:'
      input = gets.chomp
    end
    index = input.to_i - 1
    @main_menu_options[index][:method]
  end
end

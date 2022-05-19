#!/usr/bin/env ruby

require './app'
require './helpers/utils'
require './models/menu'

def main
  app = App.new
  menu = MainMenu.new

  menu.print_menu
  loop do
    method = menu.receive_valid_input
    break if method == 'exit'

    app.run(method)
  end
  print_div
  puts 'Thank you for using this app!'
  app.save_data
end

main

require_relative 'modules/show_menu'
require_relative 'modules/option'

class Main
  include Show
  include Options

  def initialize
    puts
    puts 'Welcome to your Catalog of things!'
  end

  def run_method
    show_menu
    user_choice = gets.chomp
    send(select_option(user_choice))
  end
end

main = Main.new
main.run_method

require_relative 'app'
require_relative 'modules/show_menu'
require_relative 'modules/option'

class Main
  include Show
  include Options

  def initialize
    @app = App.new
    puts
    puts 'Welcome to your Catalog of things!'
  end

  def run_method
    loop do
      show_menu
      user_choice = gets.chomp
      method = select_option(user_choice)[user_choice]
      if method.nil?
        puts 'Invalid option, please try again!'
        puts
      else
        @app.send(method)
        @app.save
      end
    end
  end
end

main = Main.new
main.run_method

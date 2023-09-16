require_relative '../classes/game'
require 'date'

module GameModule
  def create_game
    puts 'Enter game details'

    print 'Publish date (YYYY-MM-DD): '
    publish_date = Date.parse(gets.chomp)

    print 'MultiPlayer (true / false): '
    multiplayer_input = gets.chomp.downcase
    multiplayer = multiplayer_input == 'true'

    print 'Last played Date (YYYY-MM-DD): '
    last_played_at = Date.parse(gets.chomp)

    new_game = Game.new(publish_date, multiplayer, last_played_at)
    @games << new_game

    puts 'Game created and added to collection'
  end

  def list_games
    @games.each_with_index do |game, index|
      puts "[#{index + 1}] [Game] #{game}"
    end
  end
end

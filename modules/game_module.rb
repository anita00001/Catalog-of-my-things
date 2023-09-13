require_relative '../classes/game'

module GameModule
  def create_game
    puts "Enter game details"

    print "ID: "
    id = gets.chomp.to_i

    print "Publish date (YYYY-MM-DD): "
    publish_date = Date.parse(gets.chomp)

    print "MultiPlayer (true / false): "
    multiplayer_input = gets.chomp.downcase
    multiplayer = multiplayer_input == 'true'

    print "Last played Date (YYY-MM-DD): "
    last_played_at = Date.parse(gets.chomp)

    new_game = Game.new(id, publish_date, multiplayer, last_played_at)
    @games << new_game

    puts "Game created and added to collection"
  end

  def list_games
    puts "List of games: "
    @games.each do |game|
      last_played_format = game.last_played_at.strftime("%Y-%m-%d")
      multiplayer_display = game.multiplayer ? 'true' : 'false'
      puts "ID: #{game.id}, Multiplayer: #{multiplayer_display}, Last played date: #{last_played_format}"
    end
  end
end

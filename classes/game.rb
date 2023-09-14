require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(_publish_date, multiplayer, last_played_at)
    super(id)
    @id = Random.rand(100...10_000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now - @last_played_at) > (365 * 2 * 24 * 60 * 60) # 2 years in seconds
  end

  def to_s
    "ID: #{@id}, Multiplayer: #{@multiplayer}, Last played date: #{@last_played_at}"
  end

  def self.load_from_json(file_path)
    JSON.parse(File.read(file_path)).map do |game_data|
      Game.new(
        game_data['id'],
        Date.parse(game_data['publish_date']),
        game_data['multiplayer'],
        Time.parse(game_data['last_played_at'])
      )
    end
  end

  def save_to_json(file_path)
    game_data = {
      'id' => @id,
      'publish_date' => @publish_date.to_s,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at.to_s
    }

    File.open(file_path, 'a') do |file|
      file.puts(game_data.to_json)
    end
  end

  def save
    SaveDataToFile.save_to_json('games.json', [self])
  end
end

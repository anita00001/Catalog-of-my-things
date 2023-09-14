require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(id)
    @id = Random.rand(100...10_000)
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "ID: #{@id}, Pulish date: #{@publish_date}, On Sportify: #{@on_spotify}"
  end

  def save_to_json(file_path)
    music_album_data = {
      'id' => @id,
      'publish_date' => @publish_date.to_s,
      'on_spotify' => @on_spotify
    }

    File.open(file_path, 'a') do |file|
      file.puts(music_album_data.to_json)
    end
  end

  def save
    SaveDataToFile.save_to_json('music_albums.json', [self])
  end
end

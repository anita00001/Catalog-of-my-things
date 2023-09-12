class Genre
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def save_to_json(file_path)
    genre_data = {
      'id' => @id,
      'name' => @name
    }

    File.open(file_path, 'a') do |file|
      file.puts(genre_data.to_json)
    end
  end

  def save
    SaveDataToFile.save_to_json('genres.json', [self])
  end
end

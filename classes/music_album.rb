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
    "ID: #{@id}, Publish date: #{@publish_date}, On Sportify: #{@on_spotify}"
  end
  
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'on_sportify' => @on_sportify
    }.to_json(*args)
  end
end

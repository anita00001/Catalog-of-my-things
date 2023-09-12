class MusicAlbum
  attr_accessor :on_spotify

  def initialize(on_spotify)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    !@on_spotify
  end
end

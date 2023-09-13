module MusicAlbum
  def create_music_album
    puts "Enter music album details: "

    print "ID: "
    id = gets.chomp

    print "Enter published date (YYYY-MM-DD): "
    publish_date = Date.parse(gets.chomp)

    print "On sportify? (true / false): "
    on_spotify_input = gets.chomp.downcase
    on_spotify = on_spotify_input == 'true'

    new_music_album = MusicAlbum.new(id, publish_date, on_spotify)
    @MusicAlbum << new_music_album

    puts "Music album created and added"
  end

  def list_music_album
    puts "List of music albums: "
    @music_albums. each do |music_album|
      on_spotify_display = music_album.on_spotify ? 'true' : 'false'
      puts "ID: #{music_album.id}, Pulish date: #{music_album.publish_date}, On Sportify: #{on_spotify_display}"
    end
  end
end

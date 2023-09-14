require_relative '../classes/genre'

module GenreModule
  def create_genre
    puts 'Create genre: '

    print 'Name: '
    name = gets.chomp

    new_genre = Genre.new(name)
    @genres << new_genre

    puts 'Genre created successfully' 
  end

  def list_genres
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}, Name: #{genre.name}"
    end
  end
end
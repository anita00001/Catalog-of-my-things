require_relative '../classes/genre'

module GenreModule
  def create_genre
    puts 'Enter genre name: '

    print 'Name: '
    name = gets.chomp

    new_genre = Genre.new(name)
    @genres << new_genre

    puts 'Genre created successfully' 
  end

  def list_genres
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}, Genre ID: #{genre.id}, Name: #{genre.name}"
    end
  end
end
require_relative '../classes/genre'

module GenreModule
  def create_genre
    puts 'Enter genre name: '

    puts 'Name: '
    name = gets.chomp

    new_genre = Genre.new(name)
    @genres << new_genre

    unless @items.empty?
      puts 'Select item to add to genre [Choose by index] (NOT ID): '
      list_items
      item_idx = gets.chomp.to_i
      new_genre.add_item(@items[item_idx - 1])
    end
    puts 'Genre created successfully'
  end

  def list_genres
    @genres.each_with_index do |genre, index|
      puts "[#{index + 1}] [Genre] #{genre}"
    end
  end
end

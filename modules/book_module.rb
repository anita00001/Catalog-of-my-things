require_relative '../classes/book'

module BookModule
  def create_book
    puts 'Published date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Publisher name:'
    publisher = gets.chomp
    puts 'Cover state:'
    cover_state = gets.chomp
    @books << Book.new(publish_date, publisher, cover_state)
    puts 'Book created successfully!'
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1} #{book}"
    end
  end
end

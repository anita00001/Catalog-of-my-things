require_relative '../classes/author'

module AuthorModule
  def create_author
    print 'First Name:'
    f_name = gets.chomp
    print 'Last Name:'
    l_name = gets.chomp

    new_author = Author.new(f_name, l_name)
    @authors << new_author

    unless @items.empty?
      puts 'Select item to add to author [Choose by index] (NOT ID): '
      list_items
      item_idx = gets.chomp.to_i
      new_author.add_item(@items[item_idx - 1])
    end
    puts 'Author created successfully!'
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "[#{index + 1}] [Author] #{author}"
    end
  end
end

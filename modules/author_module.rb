require_relative '../classes/author'

module AuthorModule
  def create_author(item = nil)
    print 'First Name:'
    f_name = gets.chomp
    print 'Last Name:'
    l_name = gets.chomp
    if item.nil?
      @authors << Author.new(f_name, l_name)
    else
      new_author = Author.new(f_name, l_name)
      new_author.add_item(item)
      @authors << new_author
    end
    puts 'Author created successfully!'
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) Author Name: '#{author.f_name} #{author.l_name}'"
    end
  end
end

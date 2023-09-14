require_relative '../classes/author'

module AuthorModule
  def create_author
    print 'First Name:'
    f_name = gets.chomp
    print 'Last Name:'
    l_name = gets.chomp

    new_author = Author.new(f_name, l_name)
    @authors << new_author
    puts 'Author created successfully!'
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) Author Name: '#{author.f_name} #{author.l_name}'"
    end
  end
end

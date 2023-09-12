class Author
  attr_accessor :f_name, :l_name
  attr_reader :items

  def initialize(f_name, l_name)
    @id = Random.rand(1...1000)
    @f_name = f_name
    @l_name = l_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include? item
  end
end

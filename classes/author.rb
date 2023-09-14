require_relative 'item'

class Author < Item
  attr_accessor :f_name, :l_name
  attr_reader :items

  def initialize(f_name, l_name)
    super(id)
    @id = Random.rand(1...1000)
    @f_name = f_name
    @l_name = l_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include? item
  end

  def to_s
    "Id: #{@id}, Author Name: '#{@f_name} #{@l_name}'"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'f_name' => @f_name,
      'l_name' => @l_name,
      'items' => @items
    }.to_json(*args)
  end
end

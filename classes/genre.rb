require_relative 'item'

class Genre < Item
  attr_accessor :id, :name

  def initialize(name)
    super(id)
    @id = rand(100...10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end

  def to_s
    "ID: #{@id}, Name: #{@name}"
  end
  
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'items' => @items.map { |item| item.to_json }
    }.to_json(*args)
  end
end

class Genre
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

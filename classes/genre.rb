class Genre
  attr_accessor :id, :name

  def initialize(id = Random.rand(100...10_000), name)
    super(id)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
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

class Label < Item
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    super(id)
    @id = id.nil? ? Random.rand(100..10_000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item unless @items.include?(item)
  end

  def to_s
    "Id: #{@id}, Title: #{@title}, Color: #{@color}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end
end

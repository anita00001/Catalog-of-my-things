require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(id)
    @id = id.nil? ? Random.rand(100..10_000) : id
    @publish_date = publish_date
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if super
      true
    else
      @cover_state == 'bad'
    end
  end

  def to_s
    "Id: #{@id}, Published: #{@publish_date}, Publisher: #{@publisher}, Cover State: #{@cover_state}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end

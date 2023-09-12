class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, publish_date)
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

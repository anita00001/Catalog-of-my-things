require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if super
      true
    else
      @cover_state == 'bad'
    end
    # super || @cover_state == 'bad'
  end
end

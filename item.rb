class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archive
  attr_reader :archive

  def initialize(id, genre, author, source, label, publish_date, archive)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archive = archive


    def can_be_archived?
      (Date.today - @publish_date).to_i > 3652
    end

    def move_to_archive
      if can_be_archived?
        @archive = true
      end
    end
end

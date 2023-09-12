class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date
  attr_reader :archive

  def initialize(params)
    @id = params[:id]
    @genre = params[:genre]
    @author = params[:author]
    @source = params[:source]
    @label = params[:label]
    @publish_date = params[:publish_date]
    @archive = params.fetch(:archive, false)
  end

  def can_be_archived?
    (Date.today - @publish_date).to_i > 3652
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end

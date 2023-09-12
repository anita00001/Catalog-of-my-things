BOOK_FILE = 'data/books.json'.freeze
LABEL_FILE = 'data/labels.json'.freeze

module DataManager
  def save_files
    directory_name = 'data'
    FileUtils.mkdir_p(directory_name)

    File.write(BOOK_FILE, @books.to_json)
    File.write(LABEL_FILE, @labels.to_json)
  end

  # rubocop:disable Style/GuardClause
  def load_books
    @books = []
    if File.exist?(BOOK_FILE)
      JSON.parse(File.read(BOOK_FILE)).map do |book|
        book_object = create_book_object(book)
        @books << book_object
        @items << book_object
      end
    end
  end

  def load_labels
    @labels = []
    if File.exist?(LABEL_FILE)
      JSON.parse(File.read(LABEL_FILE)).map do |label|
        label_object = create_label_object(label)
        @labels << label_object
      end
    end
  end

  private

  # rubocop:enable Style/GuardClause
  def create_book_object(book)
    Book.new(book['publish_date'], book['publisher'], book['cover_state'])
  end

  def create_label_object(label)
    Label.new(label['title'], label['color'])
  end
end

require 'json'

require_relative 'modules/book_module'
require_relative 'modules/label_module'

require_relative 'modules/music_album_module'

require_relative 'modules/game_module'
require_relative 'modules/author_module'

require_relative 'modules/option'

require_relative 'data_manager'

class App
  include BookModule
  include LabelModule
  include MusicAlbumModule
  include GameModule
  include AuthorModule

  include DataManager

  def initialize
    @items = []
    @MusicAlbum = []
    @games = []
    load_books
    load_labels
    load_authors
  end

  def save
    save_files
  end

  def exit
    puts 'Thank you for using the app, see you later!'
    puts
    Kernel.exit
  end
end

module Options
  def select_option(_user_choice)
    {
      '1' => :list_all_books,
      '2' => :list_all_music_albums,
      '3' => :list_all_games,
      '4' => :list_all_genres,
      '5' => :list_all_labels,
      '6' => :list_all_authors,
      '7' => :add_book,
      '8' => :add_music_album,
      '9' => :add_game,
      '10' => :exit
    }
  end
end

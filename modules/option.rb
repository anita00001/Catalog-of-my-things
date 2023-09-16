module Options
  def select_option(_user_choice)
    {
      '1' => :create_book,
      '2' => :create_label,

      '3' => :create_music_album,
      '4' => :create_genre,

      '5' => :create_game,
      '6' => :create_author,

      '7' => :list_books,
      '8' => :list_labels,

      '9' => :list_music_album,
      '10' => :list_genres,

      '11' => :list_games,
      '12' => :list_authors,

      '13' => :exit
    }
  end
end

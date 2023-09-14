require_relative '../classes/genre'

describe Genre do
  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Rock')
      item = double('item')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end

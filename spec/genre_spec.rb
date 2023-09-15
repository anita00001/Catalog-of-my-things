require 'rspec'
require_relative '../classes/genre'

describe Genre do
  let(:genre_name) { 'Test Genre' }
  let(:genre) { Genre.new(genre_name) }
  describe '#add_item' do
    it 'should add an item to the genre' do
      item = double('Item')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      expect(genre.instance_variable_get(:@items)).to include(item)
    end
  endruby main.
end

require_relative '../classes/author'
require 'rspec'
require 'json'

describe Author do
  let(:author) { Author.new('John', 'Doe') }

  context 'when initialized' do
    it 'should create a new Author instance' do
      expect(author).to be_an_instance_of Author
    end

    it 'should matches the first and last name' do
      expect(author.f_name).to eq('John')
      expect(author.l_name).to eq('Doe')
    end

    it 'should have an empty items array' do
      expect(author.items).to eq([])
    end
  end

  context 'when adding an item' do
    it 'should add an item to the items array' do
      item = double('item')
      allow(item).to receive(:author=)
      allow(item).to receive(:author)
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'should set the suthor of the item to itself' do
      item = double('item')
      allow(item).to receive(:author=)
      allow(item).to receive(:author)
      author.add_item(item)
      expect(item).to have_received(:author=).with(author)
    end

    it 'should not add the same item twice' do
      item = double('item')
      allow(item).to receive(:author=)
      allow(item).to receive(:author)
      author.add_item(item)
      author.add_item(item)
      expect(author.items).to eq([item])
      expect(author.items.size).to eq(1)
    end
  end

  context 'when returning string of the author' do
    it 'should returns a string representation of the author' do
      author.id = 123
      expect(author.to_s).to eq("Id: 123, Author Name: 'John Doe'")
    end
  end

  context 'when returning json of the author' do
    it 'should returns a json representation of the author' do
      author.id = 123
      expect(author.to_json).to eq('{"json_class":"Author","id":123,"f_name":"John","l_name":"Doe","items":[]}')
    end
  end
end

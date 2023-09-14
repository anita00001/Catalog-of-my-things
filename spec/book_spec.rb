require 'rspec'
require 'json'
require_relative '../classes/book'

describe Book do
  let(:book) { Book.new('2017-01-01', 'Publisher1', 'good') }

  context 'when initializing a book' do
    it 'should set the publish date, publisher, and cover state' do
      publish_date = '2023-09-14'
      publisher = 'Publisher2'
      cover_state = 'good'

      book = Book.new(publish_date, publisher, cover_state)

      expect(book.publish_date).to eq(publish_date)
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end
  end

  context 'when creating a new book' do
    it 'should have a publish date' do
      expect(book.publish_date).to eq('2017-01-01')
    end

    it 'should have a publisher' do
      expect(book.publisher).to eq('Publisher1')
    end

    it 'should have a cover state' do
      expect(book.cover_state).to eq('good')
    end
  end

  context 'when checking if the book can be archived' do
    it 'should return true when cover state is "bad"' do
      book.cover_state = 'bad'
      expect(book.can_be_archived?).to be(true)
    end

    it 'should return false when cover state is not "bad"' do
      book.cover_state = 'good'
      expect(book.can_be_archived?).to be(false)
    end
  end

  context 'when converting the book to a string' do
    it 'should return a string representation of the book with generated ID' do
      allow(book).to receive(:id).and_return(nil)
      expect(book.to_s).to match(/^Id: \d+, Published: 2017-01-01, Publisher: Publisher1, Cover State: good$/)
    end

    it 'should return a string representation of the book with specified ID' do
      book.id = 123
      expect(book.to_s).to eq('Id: 123, Published: 2017-01-01, Publisher: Publisher1, Cover State: good')
    end
  end

  context 'when converting the book to JSON' do
    it 'should return a valid JSON representation' do
      book.id = 168
      expected_json = {
        JSON.create_id => 'Book',
        'id' => 168,
        'publisher' => 'Publisher1',
        'publish_date' => '2017-01-01',
        'cover_state' => 'good'
      }.to_json

      expect(book.to_json).to eq(expected_json)
    end
  end
end

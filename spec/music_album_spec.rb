require_relative '../classes/music_album'
require 'json'

describe MusicAlbum do
  let(:publish_date) { '2023-09-14' }
  let(:on_spotify) { true }
  let(:album) { MusicAlbum.new(publish_date, on_spotify) }

  describe '#initialize' do
    it 'should initialize a MusicAlbum object with a publish date and on_spotify flag' do
      expect(album).to be_an_instance_of(MusicAlbum)
      expect(album.publish_date).to eq(publish_date)
      expect(album.on_spotify).to eq(on_spotify)
    end

    it 'should initialize a MusicAlbum object with a random id' do
      expect(album.id).to be_an_instance_of(Integer)
    end
  end

  describe '#can_be_archived?' do
    it 'returns false if the album can be archived and overrides' do
      music_album = MusicAlbum.new('2023-09-14', true)
      expect(music_album.can_be_archived?).to be(false)
    end

    it 'returns false if the album can be archived' do
      music_album = MusicAlbum.new('2023-09-14', true)
      expect(music_album.can_be_archived?).to be(false)
    end
  end

  describe 'when converting the music album to a string' do
    it 'should return a string representation of the music album' do
      album.id = 123
      expected_string = 'ID: 123, Publish date: 2023-09-14, On Sportify: true'
      expect(album.to_s).to eq(expected_string)
    end
  end

  describe '#to_json' do
    it 'should return a JSON representation of the album' do
      album.id = 123
      album.instance_variable_set(:@on_spotify, true)
      json_data = JSON.parse(album.to_json)
      expect(json_data['id']).to eq(album.id)
      expect(json_data['publish_date']).to eq(album.publish_date)
      expect(json_data['on_spotify']).to be true
    end
  end
end

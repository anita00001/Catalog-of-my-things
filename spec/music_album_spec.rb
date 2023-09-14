require_relative '../classes/music_album'

describe MusicAlbum do
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
  
  describe MusicAlbum do
    let(:music_album) { MusicAlbum.new('2023-09-14', true) }
  
    context 'when converting the music album to a string' do
      it 'should return a string representation of the music album' do
        expected_string = 'Publish date: 2023-09-14, On Sportify: true'
        expect(music_album.to_s).to eq(expected_string)
      end
    end
  end
end

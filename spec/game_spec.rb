require 'rspec'
require_relative '../classes/game'

describe Game do
  let(:current_time) { Time.now }
  let(:two_years_ago) { current_time - (365 * 2 * 24 * 60 * 60) }
  let(:game) { Game.new(nil, true, current_time) }

  context 'When Initializing the Game object' do
    it 'should have a valid ID' do
      expect(game.id).to be_a(Integer)
      expect(game.id).to be >= 100 && be <= 10_000
    end

    it 'should set multiplayer and last_played_at correctly' do
      expect(game.multiplayer).to eq(true)
      expect(game.last_played_at).to eq(current_time)
    end
  end

  context 'when checking if a game can be archived' do
    it 'should return true if last_played_at is more than 2 years ago' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
      game.last_played_at = two_years_ago
      expect(game.can_be_archived?).to eq(true)
    end

    it 'should return false if last_played_at is less than 2 years ago' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
      expect(game.can_be_archived?).to eq(false)
    end
  end

  context 'when converting to string' do
    it 'should return a string with the game ID, multiplayer status, and last played date' do
      expected_string = "ID: #{game.id}, Multiplayer: #{game.multiplayer}, Last played date: #{game.last_played_at}"
      expect(game.to_s).to eq(expected_string)
    end
  end

  context 'when converting to JSON' do
    it 'should return a valid JSON representation' do
      json_data = game.to_json
      expect { JSON.parse(json_data) }.not_to raise_error
    end
  end
end

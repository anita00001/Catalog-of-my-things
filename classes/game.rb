require_relative 'item'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(id)
    @id = id.nil? ? Random.rand(100..10_000) : id
    @publish_date = publish_date
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now - @last_played_at) > (365 * 2 * 24 * 60 * 60) # 2 years in seconds
  end

  def to_s
    "ID: #{@id}, Published date: #{@publish_date}, Multiplayer: #{@multiplayer}, Last played date: #{@last_played_at}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end
end

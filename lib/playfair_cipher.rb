require 'key_builder'
require 'table_builder'

class PlayfairCipher

  attr_reader :key

  def initialize( user_phrase )
    setup_key( user_phrase )
    @table = TableBuilder.new self.key
  end

  def encrypt( message )
    message = normalize_message( message )
    digraphs = break_into_diagraphs( message )
    p digraphs
    encrypted = digraphs.map { |diagraph| @table.encrypt( diagraph ) }
    encrypted.join
  end

  private
  def break_into_diagraphs( message )
    trail_char = ( message.length.odd? ? message[-1] : "" )
    result = message.scan(/\w{2}/).map do |pair|
      if pair[0] == pair[1]
        "#{pair[0]}X#{pair[1]}"
      else
        pair
      end
    end
    prepared_message = result.join + trail_char
    pad_message(prepared_message).scan(/\w{2}/)
  end

  def pad_message( message )
    if message.length.odd?
      message += 'Z'
    else
      message
    end
  end

  def normalize_message( message )
    message = message.upcase.gsub(/[^A-Z]/,'')
    message.gsub('J','I')
  end

  def setup_key( user_phrase )
    kb = KeyBuilder.new( user_phrase )
    @key = kb.key
  end
end

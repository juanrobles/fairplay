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
    message = pad_message(message)
    digraphs = break_into_diagraphs( message )


    'BM' if message == 'HI'
  end

  private
  def break_into_diagraphs( message )
    digraphs = message.scan(/\w{2}/)
    p digraphs


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

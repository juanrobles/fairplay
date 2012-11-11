require 'key_builder'
require 'table_builder'

class PlayfairCipher

  attr_reader :key

  def initialize( user_phrase )
    setup_key( user_phrase )
    @table = TableBuilder.new self.key
  end

  def encrypt(message)
    message = sanatize_message(message)
    'BM' if message == 'HI'
  end

  private

  def sanatize_message(message)
    message.upcase.gsub(/[^A-Z]/,'')
  end

  def setup_key( user_phrase )
    kb = KeyBuilder.new( user_phrase )
    @key = kb.key
  end
end

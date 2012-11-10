require 'key_builder'

# This class builds the table used by Playfair to encode messages.
class TableBuilder
  attr_accessor :table
  attr_reader   :key

  def initialize(key_provider)
    @key = key_provider.key
  end

  private


end

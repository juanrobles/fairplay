require 'key_builder'

class TableBuilder
  attr_accessor :table, :full_key

  def initialize(key)
    self.full_key = KeyBuilder.new(key).full_key
  end

  private



end

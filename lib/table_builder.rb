require 'key_builder'

class TableBuilder
  attr_accessor :table, :key

  def initialize(key)
    self.key = KeyBuilder.new(key).key
  end

  private



end

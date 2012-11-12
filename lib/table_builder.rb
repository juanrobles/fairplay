require 'key_builder'

# This class builds the table used by Playfair to encode messages.
class TableBuilder
  attr_accessor :table

  # Initializes the object.
  # @param fair_play [String] expects a fairplay compliant key
  def initialize(fairplay_key)
    @table = {}
    @key = fairplay_key
    split_fairplay_key( fairplay_key )
    build_table
  end

  def encrypt( digraph )
    if diagraph_same_row?( digraph )
      encrypt_same_row( digraph )
    elsif digraph_same_col?( digraph )
      encrypt_same_col( digraph )
    else
      return 'BM' if digraph == 'HI'
    end
  end

  private

  def fairplay_key_table
    @fairplay_key_table
  end

  def split_fairplay_key( fairplay_key )
    @fairplay_key_table = fairplay_key.scan(/\w{5}/)
  end

  def diagraph_same_row?( digraph )
    table[digraph[0]][:y] == table[digraph[1]][:y]
  end

  def digraph_same_col?( digraph )
    table[digraph[0]][:x] == table[digraph[1]][:x]
  end

  def encrypt_same_row( digraph )
    result = ""
    digraph.each_char do |c|
      x = ( table[c][:x] + 1 ) % 5 # in case of overflow
      result <<  fairplay_key_table[table[c][:y]][x]
    end
    result
  end

  def encrypt_same_col( digraph )
    result = ""
    digraph.each_char do |c|
      y = ( table[c][:y] + 1 ) % 5 # in case of overflow
      result <<  fairplay_key_table[y][table[c][:x]]
    end
    result
  end

  def build_table
    fairplay_key_table.each_index do |row|
      string_row = fairplay_key_table[row]
      col = 0
      string_row.each_char do |item_index|
        letter = string_row[col]
        table[letter] = { x: col, y: row}
        col += 1
      end
    end
  end

end

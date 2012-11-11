require 'key_builder'

# This class builds the table used by Playfair to encode messages.
class TableBuilder
  attr_accessor :table

  # Initializes the object.
  # @param fair_play [String] expects a fairplay compliant key
  def initialize(fairplay_key)
    @table = {}
    build_table(fairplay_key)
  end

  private

  def build_table(fairplay_key)
    string_table = fairplay_key.scan(/\w{5}/)
    string_table.each_index do |row_index|
      string_row = string_table[row_index]
      col_pos = 0
      string_row.each_char do |item_index|
        letter = string_row[col_pos]
        self.table[letter] = { x: col_pos, y: row_index}
        col_pos += 1
      end
    end
  end

end

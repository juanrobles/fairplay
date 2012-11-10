class KeyBuilder
  DEFAULT_KEY = "ABCDE" + "FGHIK" + "LMNOP" + "QRSTU" + "VWXYZ"
  private_constant :DEFAULT_KEY
  attr_accessor :full_key

  def initialize(key)
    key_to_build = ( key.nil? || key.empty? ) ? DEFAULT_KEY : key
    key_to_build = sanatize_key(key_to_build)
    build_key(key_to_build)
  end

  private

  def build_key(key)
    temp_key = ''
    key.each_char { |c| temp_key << c if !temp_key.include?(c)  }
    DEFAULT_KEY.each_char { |c| temp_key << c if !temp_key.include?(c) }
    self.full_key = temp_key
  end

  def sanatize_key(short_key)
    key = short_key.upcase.gsub(/[^A-Z]/,'')
    key.gsub('J', 'I')
  end
end

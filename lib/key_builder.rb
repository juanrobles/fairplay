# Builds a Playfair key using a phrase given.
# For example you can pass a pharse like: "Playfajr example!" and a it builds a key
# that complies with the Playfair rules: "PLAYFIREXMBCDGHKNOQSTUVWZ"
class KeyBuilder
  DEFAULT_KEY = "ABCDE" + "FGHIK" + "LMNOP" + "QRSTU" + "VWXYZ"
  private_constant :DEFAULT_KEY

  attr_accessor :key

  def initialize(phrase)
    temp_key = ( !phrase || phrase.empty? ) ? DEFAULT_KEY : phrase
    temp_key = sanatize_phrase(temp_key)
    temp_key = replace_equivalent_letters(temp_key)
    build_key(temp_key)
  end

  private

  def build_key(phrase)
    temp_key = ''
    phrase.each_char { |c| temp_key << c if !temp_key.include?(c)  }
    DEFAULT_KEY.each_char { |c| temp_key << c if !temp_key.include?(c) }
    self.key = temp_key
  end

  def sanatize_phrase(phrase)
    phrase.upcase.gsub(/[^A-Z]/,'')
  end

  def replace_equivalent_letters(phrase)
    phrase.gsub('J', 'I')
  end
end

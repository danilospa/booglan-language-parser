require './src/booglan/text'

module Booglan
  ALPHABET = %w[t w h z k d f v c j x l r n q m g p s b]
  FOO_LETTERS = %w[r t c d b]
  BAR_LETTERS = ALPHABET - FOO_LETTERS
  NUMBER_BASE = ALPHABET.size

  def self.preposition?(word)
    word.size == 5 and BAR_LETTERS.include?(word[-1]) and !word.include?('l')
  end

  def self.verb?(word)
    word.size > 7 and BAR_LETTERS.include?(word[-1])
  end

  def self.subjunctive_verb?(word)
    verb?(word) and BAR_LETTERS.include?(word[0])
  end

  def self.to_number(word)
    booglan_number = word.reverse.chars.map { |l| from_decimal(ALPHABET.find_index(l)) }.join
    to_decimal(booglan_number)
  end

  def self.pretty_number?(word)
    number = to_number(word)
    number >= 422224 and number % 3 == 0
  end

  def self.sort(words)
    words.sort { |w1, w2| compare_words(w1, w2) }
  end

  def self.compare_words(first_word, second_word)
    different_chars = first_word.chars.zip(second_word.chars).detect do |chars|
      first_word_char, second_word_char = chars
      first_word_char != second_word_char
    end
    first_word_char, second_word_char = different_chars
    return -1 if first_word_char.nil?
    return 1 if second_word_char.nil?
    # The spaceship operator returns 1 when first argument is greater than the second. Otherwise, it returns -1
    ALPHABET.find_index(first_word_char) <=> ALPHABET.find_index(second_word_char)
  end

  private

  def self.from_decimal(number)
    number.to_s(NUMBER_BASE)
  end

  def self.to_decimal(string)
    string.to_i(NUMBER_BASE)
  end
end

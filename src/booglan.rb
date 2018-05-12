module Booglan
  ALPHABET = %w[t w h z k d f v c j x l r n q m g p s b]
  FOO_LETTERS = %w[r t c d b]
  BAR_LETTERS = ALPHABET - FOO_LETTERS

  def self.preposition?(word)
    word.size == 5 and BAR_LETTERS.include?(word[-1]) and !word.include?('l')
  end

  def self.verb?(word)
    word.size > 7 and BAR_LETTERS.include?(word[-1])
  end
end

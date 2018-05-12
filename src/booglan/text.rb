require './src/booglan'

module Booglan
  class Text
    attr_reader :words

    def initialize(text)
      @words = text.split
    end

    def prepositions
      words.select { |w| Booglan::preposition?(w) }
    end
  end
end

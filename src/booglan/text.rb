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

    def verbs
      words.select { |w| Booglan::verb?(w) }
    end

    def subjunctive_verbs
      words.select { |w| Booglan::subjunctive_verb?(w) }
    end

    def pretty_numbers
      words.select { |w| Booglan::pretty_number?(w) }
    end

    def ordered_vocabulary
      Booglan::sort(words).uniq
    end
  end
end

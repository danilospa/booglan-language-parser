require './src/booglan/text'

TEXT = File.read('./spec/fixtures/example_booglan_text')

RSpec.describe Booglan::Text do
  subject { described_class.new(TEXT) }

  describe '#prepositions' do
    it 'returns correct number of prepositions' do
      expect(subject.prepositions.size).to be 49
    end
  end

  describe '#verbs' do
    it 'returns correct number of verbs' do
      expect(subject.verbs.size).to be 71
    end
  end

  describe '#subjunctive_verbs' do
    it 'returns correct number of subjunctive verbs' do
      expect(subject.subjunctive_verbs.size).to be 58
    end
  end

  describe '#pretty_numbers' do
    it 'returns correct number of uniq pretty numbers' do
      expect(subject.pretty_numbers.uniq.size).to be 140
    end
  end

  describe '#ordered_vocabulary' do
    it 'returns correct ordered vocabulary' do
      expected = File.read('./spec/fixtures/ordered_vocabulary_for_example_text')
      expect(subject.ordered_vocabulary).to eq expected.split
    end
  end
end

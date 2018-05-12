require './src/booglan/text'

TEXT = File.read('./spec/fixtures/text')

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
end

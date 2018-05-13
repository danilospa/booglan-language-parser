require './src/booglan/text'

RSpec.describe Booglan::Text do
  let(:text) { 'example text' }
  subject { described_class.new(text) }

  describe '#prepositions' do
    it 'returns correct prepositions' do
      allow(Booglan).to receive(:preposition?).with('example').and_return(true)
      allow(Booglan).to receive(:preposition?).with('text').and_return(false)
      expect(subject.prepositions).to eq ['example']
    end
  end

  describe '#verbs' do
    it 'returns correct verbs' do
      allow(Booglan).to receive(:verb?).with('example').and_return(true)
      allow(Booglan).to receive(:verb?).with('text').and_return(false)
      expect(subject.verbs).to eq ['example']
    end
  end

  describe '#subjunctive_verbs' do
    it 'returns correct subjunctive verbs' do
      allow(Booglan).to receive(:subjunctive_verb?).with('example').and_return(true)
      allow(Booglan).to receive(:subjunctive_verb?).with('text').and_return(false)
      expect(subject.subjunctive_verbs).to eq ['example']
    end
  end

  describe '#pretty_numbers' do
    it 'returns correct pretty numbers' do
      allow(Booglan).to receive(:pretty_number?).with('example').and_return(true)
      allow(Booglan).to receive(:pretty_number?).with('text').and_return(false)
      expect(subject.pretty_numbers).to eq ['example']
    end
  end

  describe '#ordered_vocabulary' do
    it 'returns correct ordered vocabulary without duplicates' do
      allow(Booglan).to receive(:sort).with(['example', 'text']).and_return(['vocabulary', 'ordered', 'with', 'two', 'with'])
      expect(subject.ordered_vocabulary).to eq ['vocabulary', 'ordered', 'with', 'two']
    end
  end
end

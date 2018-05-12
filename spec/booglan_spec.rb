require './src/booglan'

RSpec.describe Booglan do
  describe '.preposition?' do
    it 'returns true for 5 letters word ending on bar letter and without l' do
      word = 'hzrrx'
      expect(described_class.preposition?(word)).to be_truthy
    end

    it 'returns false for non 5 letters word' do
      word = 'ghzrrx'
      expect(described_class.preposition?(word)).to be_falsy
    end

    it 'returns false for 5 letters word ending of foo letter' do
      word = 'hzrrb'
      expect(described_class.preposition?(word)).to be_falsy
    end

    it 'returns false for 5 letters word ending of bar letter and with l' do
      word = 'hzlrx'
      expect(described_class.preposition?(word)).to be_falsy
    end
  end

  describe '.verb?' do
    it 'returns true for 8 or more letters word ending on bar letter' do
      word = 'xmhxmmjg'
      expect(described_class.verb?(word)).to be_truthy
    end

    it 'returns false for 6 letters word' do
      word = 'mhxmmjg'
      expect(described_class.verb?(word)).to be_falsy
    end

    it 'returns false for 7 letters word ending on foo letter' do
      word = 'xmhxmmjt'
      expect(described_class.verb?(word)).to be_falsy
    end
  end

  describe '.subjunctive_verb?' do
    it 'returns true for verb starting on bar letter' do
      word = 'glkh'
      allow(described_class).to receive(:verb?).with(word).and_return(true)
      expect(described_class.subjunctive_verb?(word)).to be_truthy
    end

    it 'returns false for non verb starting on bar letter' do
      word = 'glkh'
      allow(described_class).to receive(:verb?).with(word).and_return(false)
      expect(described_class.subjunctive_verb?(word)).to be_falsy
    end

    it 'returns false for verb starting on foo letter' do
      word = 'rlkh'
      allow(described_class).to receive(:verb?).with(word).and_return(true)
      expect(described_class.subjunctive_verb?(word)).to be_falsy
    end
  end
end

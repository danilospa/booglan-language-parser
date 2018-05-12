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
end

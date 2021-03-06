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

  describe '.to_number' do
    it 'returns correct number representation based on definition' do
      word = 'hnh'
      expect(described_class.to_number(word)).to be 1062
    end
  end

  describe '.pretty_number?' do
    it 'returns true for number equal or greater than 422224 and divisible by 3' do
      word = 'flmrh' # 2cfb6/422226
      expect(described_class.pretty_number?(word)).to be_truthy
    end

    it 'returns false for number lower than 422223 and divisible by 3' do
      word = 'zlmrh' # 2cfb3/422223
      expect(described_class.pretty_number?(word)).to be_falsy
    end

    it 'returns false for number equal or greater than 422224 and not divisible by 3' do
      word = 'klmrh' # 2cfb4/422224
      expect(described_class.pretty_number?(word)).to be_falsy
    end
  end

  describe '.sort' do
    it 'returns true for number equal or greater than 422224 and divisible by 3' do
      expect(described_class.sort(['ttjp', 'ttwhsrg'])).to eq ['ttwhsrg', 'ttjp']
    end
  end

  describe '.compare_words' do
    it 'returns 1 when second word comes before the first on alphabetically order' do
      expect(described_class.compare_words('ttjp', 'ttwhsrg')).to be 1
    end

    it 'returns -1 when first word comes before the second on alphabetically order' do
      expect(described_class.compare_words('ttwhsrg', 'ttjp')).to be -1
    end

    it 'returns 1 when second word has the same letters than the first with less length' do
      expect(described_class.compare_words('ttjpd', 'ttjp')).to be 1
    end

    it 'returns -1 when first word has the same letters than the second with less length' do
      expect(described_class.compare_words('ttjp', 'ttjpd')).to be -1
    end
  end
end

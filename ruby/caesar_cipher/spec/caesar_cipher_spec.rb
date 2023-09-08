require './lib/caesar_cipher'

describe CaesarCipher do
  describe '#cipher' do
    it 'encrypts text with a shift factor of 13' do
      expect(CaesarCipher.cipher('hello world', 13)).to eql('uryyb jbeyq')
    end

    it 'encrypts text with a shift factor of 10' do
      expect(CaesarCipher.cipher('hello world', 10)).to eql('rovvy gybvn')
    end

    it 'encrypts text with a negative shift factor' do
      expect(CaesarCipher.cipher('hello world', -16)).to eql('rovvy gybvn')
    end

    it 'respects capitalization' do
      expect(CaesarCipher.cipher('Hello WORLD', 13)).to eql('Uryyb JBEYQ')
    end

    it 'respects punctuation' do
      expect(CaesarCipher.cipher('hello, world!', 13)).to eql('uryyb, jbeyq!')
    end
  end
end

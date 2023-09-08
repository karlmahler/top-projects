# frozen_string_literal: true

class CaesarCipher
  ALPHABET = Array('a'..'z')

  class << self
    def cipher(text, shift_factor)
      encrypted_text = ''

      text.each_char do |character|
        if alphabetic?(character)
          character = encrypt_character(character, shift_factor)
        end

        encrypted_text += character
      end

      encrypted_text
    end

    private

    def alphabetic?(character)
      ALPHABET.include?(character.downcase)
    end

    def encrypt_character(character, shift_factor)
      shifted_character_index = shift_character_index(character, shift_factor)
      encrypted_character = ALPHABET[shifted_character_index]

      encrypted_character = encrypted_character.upcase if uppercase?(character)

      encrypted_character
    end

    # https://en.wikipedia.org/wiki/Caesar_CaesarCipher#Example
    # Encryption of a letter x by a shift n can be described mathematically as
    # E_n(x) = (x + n) mod 26
    def shift_character_index(character, shift_factor)
      character_index = ALPHABET.index(character.downcase)
      shifted_character_index = (character_index + shift_factor) % ALPHABET.size

      shifted_character_index
    end

    def uppercase?(character)
      character == character.upcase
    end
  end
end

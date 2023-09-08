ALPHABET = Array('a'..'z')

def caesar_cipher(text, shift_factor)
  encrypted_text = ''

  text.each_char do |character|
    if alphabetic?(character)
      character = encrypt_character(character, shift_factor)
    end

    encrypted_text += character
  end

  encrypted_text
end

def alphabetic?(character)
  ALPHABET.include?(character.downcase)
end

def encrypt_character(character, shift_factor)
  shifted_character_index = shift_character_index(character, shift_factor)
  encrypted_character = ALPHABET[shifted_character_index]

  if uppercase?(character)
    encrypted_character = encrypted_character.upcase
  end

  encrypted_character
end

# https://en.wikipedia.org/wiki/Caesar_cipher#Example
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

if $PROGRAM_NAME == __FILE__
  encrypted_text1 = caesar_cipher('What a string!', 5)
  encrypted_text2 = caesar_cipher('Hello, world!', -5)
  encrypted_text3 = caesar_cipher(
    'The quick brown fox jumps over the lazy dog', 20
  )

  p "#{encrypted_text1} -> #{encrypted_text1 == 'Bmfy f xywnsl!'}"
  p "#{encrypted_text2} -> #{encrypted_text2 == 'Czggj, rjmgy!'}"
  p "#{encrypted_text3} -> #{encrypted_text3 == 'Nby kocwe vliqh zir dogjm ipyl nby futs xia'}"
end

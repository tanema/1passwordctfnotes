module Cipher
  class Vigenere
    ALPHABET = ("a".."z").to_a

    def self.encrypt(text, key:)
      self.crypt(true, text, key)
    end

    def self.decrypt(text, key:)
      self.crypt(false, text, key)
    end

    def self.crypt(encrypt, text, key)
      text, key = text.downcase, key.downcase
      if key.length < text.length
        key = text.chars.each_with_index.map { |x, i| key[i%key.length] }.join
      end
      text.chars.each_with_index.map do |char, i|
        initial, offset = ALPHABET.index(char), ALPHABET.index(key[i])
        if offset.nil? or initial.nil?
          " "
        else
          new_index = encrypt ? (initial+offset) : (initial-offset)
          ALPHABET[new_index % 26]
        end
      end.join
    end
  end
end

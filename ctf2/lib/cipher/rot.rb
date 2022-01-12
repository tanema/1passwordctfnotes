module Cipher
  class Rot
    def self.encrypt(text, key:)
      self.crypt(text, key.to_i)
    end

    def self.decrypt(text, key:)
      self.crypt(text, -key.to_i)
    end

    def self.crypt(text, n)
      key = Hash[ALPHABET.zip(ALPHABET.rotate(n))]
      text.downcase.each_char.inject("") do |e, c|
        e + (ALPHABET.include?(c) ? key[c] : c)
      end
    end
  end
end

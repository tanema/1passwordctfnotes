module Cipher
  class Caesar
    def self.encrypt(text, key:)
      self.crypt(text, key: key.to_i)
    end

    def self.decrypt(text, key:)
      self.crypt(text, key: -key.to_i)
    end

    def self.crypt(text, key:)
      text.split("").to_a.map do |x|
        ALPHABET.include?(x) ? ALPHABET[(ALPHABET.index(x)-key)%26] : x
      end.join
    end
  end
end

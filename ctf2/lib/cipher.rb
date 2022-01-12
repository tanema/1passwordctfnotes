module Cipher
  ALPHABET = ("a".."z").to_a

  autoload :Caesar, "cipher/caesar"
  autoload :Rot, "cipher/rot"
  autoload :RailFence, "cipher/rail_fence"
  autoload :Vigenere, "cipher/vigenere"

  def self.decrypt(algorithm, text, key:)
    alg = self.getAlgorithm(algorithm)
    alg.decrypt(text, key: key)
  end

  def self.encrypt(algorithm, text, key:)
    alg = self.getAlgorithm(algorithm)
    alg.encrypt(text, key: key)
  end

  def self.getAlgorithm(algorithm)
    case algorithm
    when 'caesar'
      Caesar
    when 'rail'
      RailFence
    when 'vin'
      Vigenere
    when 'rot'
      Rot
    end
  end
end

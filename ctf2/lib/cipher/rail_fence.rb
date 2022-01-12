module Cipher
  class RailFence
    def self.decrypt(text, key:)
      zigzag(key.to_i, text.length).
        sort.
        zip(text.chars).
        sort_by { |a| a[0][1] }.
        map { |a| a[1] }.
        join
    end

    def self.encrypt(text, key:)
      zigzag(key.to_i, text.length).
        zip(text.chars).
        sort.
        map { |a| a[1] }.
        join
    end

    def self.zigzag(rails, size)
      pattern = (0..rails - 1).to_a + (1..rails - 2).to_a.reverse
      pattern.cycle.first(size).zip(0..size)
    end
  end
end

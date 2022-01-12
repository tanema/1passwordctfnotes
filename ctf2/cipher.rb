#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path(File.join(__dir__, 'lib'))
require 'cipher'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: cipher [options]"
  opts.on("-d", "--decrypt", "decrypt passed string") {|v| options[:decrypt] = true}
  opts.on("-k KEY", "--key=KEY", "key for cryptography. only some have default values") {|v| options[:key] = v}
end.parse!

# Dismal break of day
# suddenly sneaky caesar
# enjoying the trains
# u   f   f   e   t   r   t   q
#  g c 1 n f b q a v r e a v v v
#   g   c   j   r   a   v   q   g

poem = "Dismal break of day suddenly sneaky caesar enjoying the trains"
encoded = 'uffetrtqgc1nfbqavreavvvgcjravqg'
decoded = 'uggcf1cnffjbeqratvarrevatvqvqvg'

algorithm = ARGV[0]
text = (STDIN.tty?) ? ARGV[1] : $stdin.read
key = options[:key]
output = if options[:decrypt]
  Cipher.decrypt(algorithm, text, key: key)
else
  Cipher.encrypt(algorithm, text, key: key)
end
puts output

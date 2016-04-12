require_relative 'utils'

# Read in our training text
text_file = ARGV.first
words = File.read(text_file).scan(/\w+/)
words = words.map{ |w| w.downcase }

puts transition_counts words

=begin
Takes an array of words and returns a hash of string => hash,
where the inner hash is of string => integer. These hashes represent
the number of times the "inner word" appears after the "outer word"
in the given text.
=end
def transition_counts words
  counts = {}

  words.each_with_index do |word, index|
      if not counts.key? word
        counts[word] = {}
      end
      if index < words.count - 1
        next_word = words[index + 1]
        if not counts[word].key? next_word
          counts[word][next_word] = 0
        end
        counts[word][next_word] += 1
      end
  end
  counts
end

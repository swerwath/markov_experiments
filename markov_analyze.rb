text_file = ARGV.first
words = File.read(text_file).scan(/\w+/)
words = words.map{ |w| w.downcase }

transition_counts = {}

words.each_with_index do |word, index|
    if not transition_counts.key? word
      transition_counts[word] = {}
    end
    if index < words.count - 1
      next_word = words[index + 1]
      if not transition_counts[word].key? next_word
        transition_counts[word][next_word] = 0
      end
      transition_counts[word][next_word] += 1
    end
end

require "yaml"

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


def transition_probabilities counts
  counts.each do |word, count_hash|
    total = 0.0
    count_hash.values.each do |i|
      total += i
    end
    count_hash.each do |word, value|
      count_hash[word] = value / total
    end
  end
end

def probability_sort transition_hash
  transition_hash.each do |key, value|
    transition_hash[key] = value.sort_by{|k, v| v}.to_h
  end
end

def write_yaml target, data
  serialized_object = YAML::dump(data)
  File.open(target, "w") do |file|
    file.puts serialized_object
  end
end

def load_yaml target
  YAML.load_file(target)
end

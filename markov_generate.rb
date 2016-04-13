require_relative 'utils'

data_file = ARGV[0]
num_words = ARGV[1].to_i

probability_data = load_yaml(data_file)

current_word = probability_data.keys[rand(probability_data.length)]
output_text = ""

num_words.times do |n|
  output_text += current_word
  rand_seed = rand
  probability_data[current_word].each do |word, prob|
    if rand_seed <= prob
      current_word = word
      break
    else
      rand_seed -= prob
    end
  end
end

puts output_text

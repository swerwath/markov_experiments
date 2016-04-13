require_relative 'utils'

data_file = ARGV[0]
num_chunks = ARGV[1].to_i

probability_data = load_yaml(data_file)

current_chunk = probability_data.keys[rand(probability_data.length)]
output_text = ""

num_chunks.times do |n|
  output_text += current_chunk
  rand_seed = rand
  probability_data[current_chunk].each do |chunk, prob|
    if rand_seed <= prob
      current_chunk = chunk
      break
    else
      rand_seed -= prob
    end
  end
end

puts output_text

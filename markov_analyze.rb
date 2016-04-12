require_relative 'utils'
require "yaml"

# Read in our training text
text_file = ARGV.first
words = File.read(text_file).scan(/\w+/)
words = words.map{ |w| w.downcase }

transition_hash = transition_counts words
puts "Finished counting, found #{transition_hash.count} unique words..."
transition_probabilities transition_hash
puts "Finished calculatating probability hash"

if text_file.rindex('/').nil?
  target_file_path = text_file[0...text_file.rindex('.')]
else
  target_file_path = text_file[(text_file.rindex('/')+1)...text_file.rindex('.')]
end
target_file_path = "analyzed_data/"+target_file_path+".yaml"

puts "Writing data to #{target_file_path}"
serialized_object = YAML::dump(transition_hash)
File.open(target_file_path, "w") do |file|
  file.puts serialized_object
end

puts "Done!"

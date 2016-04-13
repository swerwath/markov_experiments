require_relative 'utils'

# Read in our training text
text_file = ARGV[0]
chunk_size = ARGV[1].to_i
chunks = File.read(text_file).scan(/.{1,#{chunk_size}}/)
chunks = chunks.map{ |w| w.downcase }

transition_hash = transition_counts chunks # Create hash with raw counts
puts "Finished counting, found #{transition_hash.count} unique chunks..."
transition_probabilities transition_hash # Calculate transition probabilities
puts "Finished calculatating probability hash"
probability_sort transition_hash
puts "Finished sorting probability hash"

# Create dump file name from original dataset name
# something/othello.txt => analyzed_data/othello.yaml
if text_file.rindex('/').nil?
  target_file_path = text_file[0...text_file.rindex('.')]
else
  target_file_path = text_file[(text_file.rindex('/')+1)...text_file.rindex('.')]
end
target_file_path = "analyzed_data/"+target_file_path+".yaml"

# Dump our data to our serialized data to our target file
puts "Writing data to #{target_file_path}"
write_yaml target_file_path, transition_hash
puts "Done!"

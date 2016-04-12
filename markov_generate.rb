require_relative 'utils'

data_file = ARGV.first

probability_data = load_yaml(data_file)
puts probability_data

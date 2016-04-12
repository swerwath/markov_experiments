import argparse

parser = argparse.ArgumentParser()
parser.add_argument("text_file", help="text to analyze")
args = parser.parse_args()

probability_dict = {}

txt = open(args.text_file)
for line in txt:
        for word in line.split():
           probability_dict[word] = {}

print("Found " + str(len(probability_dict)) + " unique words in " + args.text_file)

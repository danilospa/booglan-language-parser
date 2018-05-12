require './src/booglan/text'

file = ARGV[0]
text = File.read(file)
booglan_text = Booglan::Text.new(text)

puts "Prepositions count: #{booglan_text.prepositions.size}"

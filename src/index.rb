require './src/booglan/text'

file = ARGV[0]
text = File.read(file)
booglan_text = Booglan::Text.new(text)

puts "Prepositions count: #{booglan_text.prepositions.size}"
puts "Verbs count: #{booglan_text.verbs.size}"
puts "Subjunctive verbs count: #{booglan_text.subjunctive_verbs.size}"

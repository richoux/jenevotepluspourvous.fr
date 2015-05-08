#!/usr/bin/ruby

if ARGV.empty?
  puts "Usage: #{$0} fichier"
  exit
end

# pour chaque ligne du fichier
File.open(ARGV[0]).each do |line|
  # on parse par les ,
  words = line.split( ',' )

  # tout en minuscule
  words[2].downcase!
  # on supprime des guillemets
  words[2].gsub!('"', '')
  # on remplace les espaces par des traits d'union
  words[2].gsub!(' ', '-')

  words[3].downcase!
  words[3].gsub!('"', '')
  words[3].gsub!(' ', '-')

  puts "#{words[2]}-#{words[3]}"
end

exit

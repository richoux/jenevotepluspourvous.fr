#!/usr/bin/ruby
# -*- coding: utf-8 -*-

if ARGV.empty?
  puts "Usage: #{$0} fichier"
  exit
end

groupe = ""

# pour chaque ligne du fichier
File.open(ARGV[0]).each do |line|
  if line.start_with?('#')
    groupe = line[1..-1]
  else
    # tout en minuscule
    line.downcase!
    # on supprime les fins de ligne
    line.strip!
    # on remplace les espaces par des traits d'union
    line.gsub!(' ', '-')
    # on supprime les accents
    line.gsub!('é', 'e')
    line.gsub!('è', 'e')
    line.gsub!('ë', 'e')
    line.gsub!('ê', 'e')
    line.gsub!('à', 'a')
    line.gsub!('ä', 'a')
    line.gsub!('â', 'a')
    line.gsub!('ö', 'o')
    line.gsub!('ô', 'o')
    line.gsub!('ï', 'i')
    line.gsub!('î', 'i')
    
    puts "#{line}_#{groupe}"
  end
end

exit

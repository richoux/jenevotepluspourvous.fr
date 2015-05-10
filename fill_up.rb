#!/usr/bin/ruby
# -*- coding: utf-8 -*-

if ARGV.empty?
  puts "Usage: #{$0} fichier1.html fichier2.txt"
  exit
end

# pour chaque ligne du fichier
File.open(ARGV[0], "w") do |file| 
  file.write("<!DOCTYPE html>\n")
  file.write("<html>\n")
  file.write("  <head>\n")
  file.write("    <meta charset=\"utf-8\" />\n\n")
  file.write("    <link rel=\"stylesheet\" href=\"jenevote.css\"/>\n")
  file.write("    <meta name=\"author\" content=\"Canard masqué\" />\n")
  file.write("    <meta name=\"description\"  content=\"La page pour se faire entendre par son/sa député-e\"/>\n")
  file.write("    <meta name=\"keywords\" content=\"PJLRenseignement parlement député vote\" />\n")
  file.write("    <title>Je ne vote plus pour vous</title>\n")
  file.write("  </head>\n")
  file.write("  <body>\n\n")

  File.open(ARGV[1]).each do |line|
    line.strip!
    nom_sans_tiret = line.gsub('-', '_')
    nom = line.gsub('-', ' ')
    nom_capital = nom.split.map(&:capitalize).join(' ')

    file.write("    <img src=\"photos/#{line}.png\" title=\"#{nom}\"/>\n")
    file.write("    <script type=\"text/javascript\">\n")
    file.write("      var clicks_#{nom_sans_tiret} = 0;\n");
    file.write("      function onClick_#{nom_sans_tiret}() {\n")
    file.write("        clicks_#{nom_sans_tiret} += 1;\n")
    file.write("        document.getElementById(\"clicks_#{nom_sans_tiret}\").innerHTML = clicks_#{nom_sans_tiret};\n")
    file.write("      };\n")
    file.write("    </script>\n")
    file.write("    <div class=\"dabox\">\n")
    file.write("      <div class=\"pos_bouton\">\n")
    file.write("        <button type=\"button\" onClick=\"onClick_#{nom_sans_tiret}()\">Je ne vote plus pour vous</br> #{nom_capital}</button>\n")
    file.write("      </div>\n")
    file.write("      <div class=\"pos_vote\">\n")
    file.write("        Voix perdues : <a id=\"clicks_#{nom_sans_tiret}\">0</a>\n")
    file.write("      </div>\n")
    file.write("    </div>\n\n")
  end

  file.write("  </body>\n")

  file.write("  <div id=\"footer\">\n")
  file.write("    <script src=\"boitenoirekiller.js\"></script>\n")
  file.write("    <a href=\"https://boitenoirekiller.com\">On n'aime pas les boîtes noires.</a>\n")
  file.write("  </div>\n")
  
  file.write("</html>\n")
end

exit

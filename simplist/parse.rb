require 'erb'

puts "Sup"


names = ["jwo", "awo", "hank", "jack"]


# 1) open the template

html_template = File.read("template.html")

# 2) compile the erb

compiled_html = ERB.new(html_template).result(binding)

# 3) output the html

File.open("index.html", "wb") do |file|
  file << compiled_html
end
